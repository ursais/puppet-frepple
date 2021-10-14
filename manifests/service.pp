# Class: frepple::service
#
# This class managed the frepple service
#
# This class should not be used directly under normal circumstances
# Instead, use the *frepple* class.
#
class frepple::service {

  if ! ($frepple::service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $frepple::manage_service == true {
    service { $frepple::service_name:
      ensure   => $frepple::service_ensure,
      enable   => $frepple::service_enable,
      provider => 'systemd',
    }
  }
}
