default.user = 'quirkafleeg'
default.rvm.user = 'quirkafleeg'
default.rvm.ruby = '1.9.3'

default.envbuilder.base_dir = '/home/quirkafleeg'
default.envbuilder.base_dbi = 'production'
default.envbuilder.owner = 'quirkafleeg'
default.envbuilder.group = 'quirkafleeg'

default.project = 'quirkafleeg'
default.govuk.app_domain = "theodi.org"
default.databags.primary = 'quirkafleeg'

default.apps.static.port = 4010
default.apps.static.assets_path = 'static'
default.apps.static.assets_allow_origin = "*"

#default.apps.signonotron2.port = 4000
#default.apps.signonotron2.deploy_name = 'signon'
#default.apps.signonotron2.mysql_db = 'signon'
#default.apps.signonotron2.migrate = 'bundle exec rake db:migrate'
#default.apps.signonotron2.is_default = true

default.apps['asset-manager'].port = 4050
default.apps['asset-manager'].mongo_db = 'govuk_content_publisher'
default.apps['asset-manager'].precompile_assets = false

  
default.apps.panopticon.port = 4020  
default.apps.panopticon.mongo_db = 'govuk_content_publisher'

default.apps.publisher.port = 4030  
default.apps.publisher.mongo_db = 'govuk_content_publisher'
default.apps.publisher.migrate = 'bundle exec rake db:seed'

default.apps.content_api.port = 4040  
default.apps.content_api.deploy_name = 'contentapi'  
default.apps.content_api.precompile_assets = false
default.apps.content_api.mongo_db = 'govuk_content_publisher'
