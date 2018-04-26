name             'ds_cronner'
version          '1.0.0'
maintainer       'Jeff Byrnes'
maintainer_email 'devops@darksky.net'
license          'Apache-2.0'
description      'Installs/Configures cronner'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
chef_version     '>= 12.14'

source_url 'https://github.com/theckman/cookbook-cronner'
issues_url 'https://github.com/theckman/cookbook-cronner/issues'

supports 'ubuntu'

depends 'cron', '>= 3.0.0'
