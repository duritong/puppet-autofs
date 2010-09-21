# manifests/ldaphome.pp
class autofs::ldaphome {
    include ::autofs
    file{"/etc/auto.ldaphome":
        source => [ "puppet:///modules/site-autofs/etc/${fqdn}/auto.ldaphome",
                    "puppet:///modules/site-autofs/etc/${domain}/auto.ldaphome",
                    "puppet:///modules/site-autofs/etc/auto.ldaphome",
                    "puppet:///autofs/etc/auto.ldaphome" ],
        require => File["/etc/auto.master"],
        notify => Service[autofs],
        owner => root, group => 0, mode => 0644;
    }
}
