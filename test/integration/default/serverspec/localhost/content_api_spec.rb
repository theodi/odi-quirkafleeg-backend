require 'spec_helper'

describe file("/etc/nginx/sites-enabled/contentapi") do
  it { should be_file }
  its(:content) { should match "server_name contentapi.theodi.org;" }
  its(:content) { should match "proxy_pass http://contentapi;" }
end

# Make sure we have some code
describe file("/var/www/contentapi/current/config.ru") do
  it { should be_file }
end

# Make sure we have environment correctly
describe file("/var/www/contentapi/current/.env") do
  its(:content) { should match /GOVUK_APP_DOMAIN: theodi.org/ }
end

describe file("/etc/init/contentapi-thin-1.conf") do
  its(:content) { should match /PORT=4040/ }
  its(:content) { should match /bundle exec thin start/ }
end

# Make sure foreman job is running
describe service("contentapi-thin-1") do
  it { should be_running }
end

describe command('curl -sL -w "%{http_code}\\n" -H "Host: contentapi.theodi.org" "http://localhost:8080/tags.json" -o /dev/null') do
  it { should return_stdout /200/ }
end