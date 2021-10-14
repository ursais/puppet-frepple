# Class to configure FrePPLe
class frepple::config {

  if $frepple::manage_config {
    file { '/etc/frepple/docker-compose.yml':
      ensure  => file,
      notify  => Service['frepple'],
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      content => epp('frepple/docker-compose.yml.epp'),
    }
  }
}
