class autofs::disable {
  package { autofs:
    ensure => absent,
  }

  file { "/etc/auto.master":
    ensure => absent,
  }

  service { autofs:
    ensure => stopped,
    enable => false,
    hasstatus => true,
    before => Package[autofs],
  }
}
