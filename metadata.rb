name             'odi-quirkafleeg-backend'
maintainer       'Open Data Institute'
maintainer_email 'tech@theoid.org'
license          'MIT'
description      'Wrapper cookbook for a quirkafleeg backend'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "odi-apt"
depends "build-essential"
depends "git"
depends "postfix"
depends "ntp"
depends "odi-users"
depends "odi-rvm"
depends "odi-pk"
depends "mysql"
depends "dictionary"
depends "imagemagick"
depends "nodejs"
depends "odi-statsd"
depends "fail2ban"
depends "odi-nginx"
depends "envbuilder"
depends "quirkafleeg-deployment"