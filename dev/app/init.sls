# GIT repository for getting the code source
# Mandatory, default: no value
deploy:
  git_url: git@github.com:spryker/demoshop.git
  git_hostname: github.com

# Autoupdate mechanism updates packages automatically on each salt run, if
# it's enabled here. If this setting is disabled (recommended for production),
# then packages can be updated by running state <state>.update, for example:
# salt '*' state.sls elasticsearch.update
autoupdate:
  # Optional, default: False
  nodejs: true

  # Optional, default: False
  elasticsearch: true

  # Optional, default: False
  php: true

  # Optional, default: False
  mysql: true

  # Optional, default: False
  postgresql: true

  # Optional, default: False
  rabbitmq: true

elasticsearch:
  # Elasticsearch major version.
  # Optional, default: 1.4
  version: 1.4

logstash:
  # Logstash major version.
  # Optional, default: 1.4
  version: 1.4

# List of stores. Note, each store defined here should be configured within
# each environment section (see below).
# Mandatory, default: no value
stores:
  - DE
#  - US

php:
  # PHP debugger / profiler. Enable only on local or QA environment, never
  # use them on production.
  # Default: xdebug is enabled only if role 'dev' is included
  # xhprof is disabled
  # Optional
  #enable_xdebug: true
  #enable_xhprof: true

  # PHP OpCache.
  # Optional, default: enabled
  #enable_opcache: true

# Newrelic credentials - leave empty for non-production setups
newrelic:
  license_key:
  api_key:
  appname:

# Configuration of environments
# It can consist of any subset of {development,testing,staging,production}
# The reference dev environment defines two environments: development and testing
# To reduce VM memory requirements, testing environment can be disabled here.
environments:
  development:
    database:
      # Zed database credentials - for both MySQL and PostgreSQL
      zed:
        # Mandatory, default: no value
        hostname: localhost

        # Mandatory, default: no value
        username: development

        # Mandatory, default: no value
        password: mate20mg

    elasticsearch:
      # JVM Heap Size of Elasticsearch
      # Optional, default: 384m
      heap_size: 384m

    redis:
      host: 127.0.0.1
      port: ''

    rabbitmq:
      # Password for RabbitMQ users created for this environment
      # Mandatory, default: no value
      password: mate20mg

    static:
      # Enable local static files virtual host in nginx?
      # Optional, Default: false
      enable_local_vhost: true

      # Hostname for local static files virtual host in nginx,
      # Required if enable_local_vhost is set to true, no default value
      hostname: static.com.spryker.dev

    cloud:
      enabled: false
      # object_storage:
      #   enabled: true
      #   rackspace:
      #     api_username: demoshop.cloudfiles
      #     api_key: a..............................5
      # cdn:
      #   enabled: true
      #   static_media:
      #     DE:
      #       http: http://static.de.spryker.dev
      #       https: https://static.de.spryker.dev
      #     # US:
      #     #   http: http://static.com.spryker.dev
      #     #   https: https://static.com.spryker.dev
      #   static_assets:
      #     DE:
      #       http: http://static.de.spryker.dev
      #       https: https://static.de.spryker.dev
      #     # US:
      #     #   http: http://static.com.spryker.dev
      #     #   https: https://static.com.spryker.dev
      #   delete_local_processed_images: true
      #   delete_original_images: true
    stores:
      # List of stores and store-specific settings. Stores listed here has to be the same as configured above in "stores" key.
      DE:
        yves:
          hostnames:
            # List of hostnames for YVES NginX VHost.
            # Mandatory, default: no value
            - www.de.spryker.dev

        zed:
          # Hostname for ZED NginX VHost. Only one value is allowed.
          # Mandatory, default: no value
          hostname: zed.de.spryker.dev

          # Path to htpasswod file. Comment out to disable http auth.
          # Optional, default: no value
          # htpasswd_file:
      # US:
      #   yves:
      #     hostnames:
      #       - www.de.spryker.devcom
      #   zed:
      #     hostname: zed.de.spryker.devcom
      #     # htpasswd_file:
#  testing:
#    database:
#      zed:
#        hostname: localhost
#        username: testing
#        password: mate20mg
#    elasticsearch:
#      heap_size: 384m
#    redis:
#      host: 127.0.0.1
#      port: ''
#    rabbitmq:
#      password: mate20mg
#    static:
#      enable_local_vhost: true
#      hostname: static.com.spryker.test
#    cloud:
#      enabled: false
#    stores:
#      DE:
#        yves:
#          hostnames:
#            - www.de.spryker.test
#        zed:
#          hostname: zed.de.spryker.test
#          #htpasswd_file:
#      # US:
#      #   yves:
#      #     hostnames:
#      #       - www.com.spryker.test
#      #   zed:
#      #     hostname: zed.spryker.test
#      #     #htpasswd_file:

# The key below is used for deployment - from deployment server user root must be able to log in to all other
# servers as user root.
# If we're using salt-cloud to create cloud VM's - it will automatically generate /root/.ssh/id_rsa
# on salt master and copy appropiate id_rsa.pub to minions to /root/.ssh/authorized_keys. Paste the content
# of /root/.ssh/id_rsa from salt-master here.
#
# On non salt-cloud environments, please generate a private SSH key and put it here. Without this, some
# mechanisms (like deployment) may fail to work.
server_env:
  ssh:
    id_rsa: |
      -----BEGIN RSA PRIVATE KEY-----
      GENERATE A NEW SSH KEY FOR EACH PROJECT AND PUT IT HERE!
      -----END RSA PRIVATE KEY-----
