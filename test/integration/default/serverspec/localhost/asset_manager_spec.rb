require 'spec_helper'

describe file("/etc/nginx/sites-enabled/asset-manager") do
  it { should be_file }
  its(:content) { should match "server_name asset-manager.theodi.org;" }
  its(:content) { should match "proxy_pass http://asset-manager;" }
end

# Make sure we have some code
describe file("/var/www/asset-manager/current/config.ru") do
  it { should be_file }
end

# Make sure we have environment correctly
describe file("/var/www/asset-manager/current/.env") do
  its(:content) { should match /GOVUK_APP_DOMAIN: theodi.org/ }
end

describe file("/etc/init/asset-manager-thin-1.conf") do
  its(:content) { should match /PORT=4050/ }
  its(:content) { should match /bundle exec thin start/ }
end

# Make sure foreman job is running
describe service("asset-manager-thin-1") do
  it { should be_running }
end

# Check we can actually access the thing - we'll get a Rails error due
# to lack of database, but that's OK as we know Rails is running.
describe command("curl -H 'Host: asset-manager.theodi.org' http://localhost:8080/healthcheck") do
  it { should return_stdout /OK/ }
end