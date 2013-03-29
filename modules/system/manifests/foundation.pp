class foundation {
    file { "/etc/apt/sources.list":
        ensure => file,
        owner  => root,
        group  => root,
        source => "puppet:///modules/system/sources.list",
    }

    exec { "import-gpg":
        command => "/usr/bin/wget -q http://www.dotdeb.org/dotdeb.gpg -O -| /usr/bin/apt-key add -",
        onlyif  => "/usr/bin/apt-key list | /bin/grep -ci dotdeb",
        notify  => Exec["/usr/bin/apt-get update"]
    }

    exec { "/usr/bin/apt-get update":
        require => File["/etc/apt/sources.list"],
    }

    package { "ntp":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }

    service { "ntp":
        ensure => running,
        require => Package["ntp"],
    }

    file { "/etc/ntp.conf":
        ensure => file,
        owner  => root,
        group  => root,
        source => "puppet:///modules/system/ntp.conf",
    }

    package { "tzdata":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }

    file { "/etc/timezone":
        ensure  => file,
        owner   => root,
        group   => root,
        source  => "puppet:///modules/system/timezone",
        require => Package["tzdata"],
    }

    package { "ntpdate":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }

    package { "sysstat":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }

    package { "curl":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }
}
