#######################################
# autofs module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#######################################


# modules_dir { "autofs": }
class autofs {
    include autofs::base
}

class autofs::base {
    # autofs needs nfs
    include nfs

    package { autofs:
        ensure => installed,
    }

    file { "/etc/auto.master":
        source => [ "puppet://$server/files/autofs/etc/${fqdn}/auto.master",
                    "puppet://$server/files/autofs/etc/${domain}/auto.master",
                    "puppet://$server/files/autofs/etc/auto.master",
                    "puppet://$server/autofs/etc/auto.master.${operatingssystem}",
                    "puppet://$server/autofs/etc/auto.master" ],
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
