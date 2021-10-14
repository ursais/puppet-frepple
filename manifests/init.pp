# Class: frepple
#
# This class wraps *frepple::install* for ease of use
#
# Parameters:
#   manage_install - Can be set to manage the installation.
#     Set to true to manage it, false to not manage it.
#     Default: true
#
#   service_name - Can be set to define a different frepple service name.
#     Default: frepple
#
#   server_name - Can be set to define the server_name of the Nginx virtual host.
#     Default: frepple.example.com
#
#   manage_config - Defines if puppet should manage the configuration.
#     Default: true
#
#   manage_service - Defines if puppet should manage the service.
#     Default: true
#
#   service_enable - Defines if the service should be enabled at boot.
#     Default: true
#
#   service_ensure - Defines if the service should be running.
#     Default: running
#
#   registry - Defines the registry to pull the docker image from.
#     Default: ursa
#
#   image - Defines the docker image to pull.
#     Default: frepple-6
#
#   tag - Defines the tag of the docker image to pull.
#     Default: latest
#
#   pghost - Defines the database host.
#     Default: db
#
#   pguser - Defines the database user.
#     Default: frepple
#
#   pgpassword - Defines the database password.
#     Default: frepple
#
#   secret_key - Defines the FrePPLe secret key.
#     Default: frepple
#
#   secret_webtoken_key - Defines the FrePPLe secret web token key.
#     Default: frepple
#
#   odoo_password_default - Defines the Odoo password.
#     Default: frepple
#
# Sample Usage:
#   include 'frepple'
# or:
#   class { 'frepple':
#     manage_install => false,
#   }
#
class frepple (
  String[1]            $service_name               = 'frepple',
  String[1]            $service_ensure             = 'running',
  Boolean              $service_enable             = true,
  Boolean              $manage_install             = true,
  Boolean              $manage_config              = true,
  Boolean              $manage_service             = true,
  # Nginx
  String[1]            $server_name                = 'frepple.example.com',
  # Docker
  String[1]            $registry                   = 'ursa',
  String[1]            $image                      = 'frepple-6',
  String[1]            $tag                        = 'latest',
  String[1]            $running_env                = 'dev',
  # FrePPLe
  String[1]            $admin_email                = 'support@opensourceintegrators.com'
  ,
  String[1]            $admin_name                 = 'Open Source Integrators',
  String[1]            $secret_key                 = 'frepple',
  String[1]            $secret_webtoken_key        = 'frepple',
  String[1]            $options                    = '{}',
  String[1]            $conn_max_age               = '60',
  String[1]            $test_name                  = 'test_frepple',
  String[1]            $logdir                     = '/var/log/frepple',
  String[1]            $sql_role                   = 'report_role',
  String[1]            $port_default               = '127.0.0.1:8002',
  String[1]            $port_scenario1             = '127.0.0.1:8003',
  String[1]            $port_scenario2             = '127.0.0.1:8004',
  String[1]            $port_scenario3             = '127.0.0.1:8005',
  String[1]            $language_code              = 'en',
  String[1]            $google_analytics           = 'None',
  String[1]            $time_zone                  = 'UTC',
  String[1]            $session_cookie_age         = '3600 * 24 * 3',
  String[1]            $attributes                 = '[]',
  String[1]            $maxmemorysize              = 'None',
  String[1]            $maxcputime                 = 'None',
  String[1]            $maxtotallogfilesize        = '200',
  String[1]            $default_user_group         = 'None',
  String[1]            $default_pagesize           = '100',
  String[1]            $default_theme              = 'earth',
  String[1]            $port                       = '8000',
  String[1]            $installed_apps_custom      = '',
  Boolean              $installed_apps_forecasting = false,
  Boolean              $installed_apps_inventory   = false,
  Boolean              $installed_apps_odoo        = false,
  # PostgreSQL
  String[1]            $pgdatabase                 = 'frepple',
  String[1]            $pghost                     = 'db',
  String[1]            $pguser                     = 'frepple',
  String[1]            $pgpassword                 = 'frepple',
  # Email
  String[1]            $email_use_tls              = 'True',
  String[1]            $default_from_email         = 'your_email@domain.com',
  String[1]            $server_email               = 'your_email@domain.com',
  String[1]            $email_host_user            = 'your_email@domain.com',
  String[1]            $email_host_password        = 'frePPLeIsTheBest',
  String[1]            $email_host                 = 'mail',
  String[1]            $email_port                 = '25',
  # Selenium
  String[1]            $selenium_tests             = 'chrome',
  String[1]            $selenium_headless          = 'True',
  # Odoo
  String[1]            $odoo_password_default      = 'frepple',
  String[1]            $csrf_cookie_samesite       = 'None',
  String[1]            $csrf_cookie_secure         = 'True',
  String[1]            $session_cookie_samesite    = 'None',
  String[1]            $session_cookie_secure      = 'True',
)
  {
    contain 'frepple::install'
    contain 'frepple::config'
    contain 'frepple::service'

    Class['frepple::install']
    -> Class['frepple::config']
    -> Class['frepple::service']
  }
