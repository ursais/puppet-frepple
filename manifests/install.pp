# == Class: frepple::install
#
# This class ensures that FrePPLe is installed
#
# This class should not be used directly under normal circumstances
# Instead, use the *frepple* class.
#
class frepple::install {

  if $frepple::manage_install {
    file { '/etc/nginx/sites-available/frepple.conf':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => epp('frepple/frepple.nginx.epp'),
    }

    file { '/etc/nginx/sites-enabled/frepple.conf':
      ensure => 'link',
      target => '/etc/nginx/sites-available/frepple.conf',
    }

    file { '/etc/systemd/system/frepple.service':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
      source => 'puppet:///modules/frepple/frepple.service',
    }
  }
}
