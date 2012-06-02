class autofs::base {
  # autofs needs nfs
  include nfs

  package { autofs:
    ensure => installed,
  }

  file { "/etc/auto.master":
    source => [ "puppet:///modules/site_autofs/etc/${::fqdn}/auto.master",
                "puppet:///modules/site_autofs/etc/${::domain}/auto.master",
                "puppet:///modules/site_autofs/etc/auto.master",
                "puppet:///modules/autofs/etc/auto.master.${::operatingssystem}",
                "puppet:///modules/autofs/etc/auto.master" ],
     notify => Service[autofs],
     owner => root, group => 0, mode => 0644;
  }

  service { autofs:
    ensure => running,
    enable => true,
    hasstatus => true,
    require => Package[autofs],
  }
}
