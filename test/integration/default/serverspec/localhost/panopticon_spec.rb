require 'spec_helper'

describe file("/etc/nginx/sites-enabled/panopticon") do
  it { should be_file }
  its(:content) { should match "server_name panopticon.theodi.org;" }
  its(:content) { should match "proxy_pass http://panopticon;" }
end

# Make sure we have some code
describe file("/var/www/panopticon/current/config.ru") do
  it { should be_file }
end

# Make sure we have environment correctly
describe file("/var/www/panopticon/current/.env") do
  its(:content) { should match /GOVUK_APP_DOMAIN: theodi.org/ }
end

describe file("/etc/init/panopticon-thin-1.conf") do
  its(:content) { should match /PORT=4020/ }
  its(:content) { should match /bundle exec thin start/ }
end

# Make sure foreman job is running
describe service("panopticon-thin-1") do
  it { should be_running }
end
