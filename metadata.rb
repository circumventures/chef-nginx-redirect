name             'nginx-redirect'
maintainer       'Geoforce, Inc.'
maintainer_email 'infrastructure@geoforce.com'
license          'MIT'
description      'Simple vhost redirector bolt-on for the nginx cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'
depends "nginx"
