# vim: set ft=ruby 

class essentials {
    package { "git":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }

    package { "htop":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
}

class apache {
    package { "apache2":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
    package { "libapache2-mod-php5":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
}

class php {
    package { "php5-common":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
    package { "php5-suhosin":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
    package { "php5-mysql":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
    package { "php5-memcache":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
    package { "php5-mcrypt":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
    package { "php5-xdebug":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
}

class mysql {
    package { "mysql-server":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
    package { "mysql-client":
        ensure => present,
        require => [Exec["/usr/bin/apt-get update"]],
    }
}

node default {
    include system-setup
    include essentials
    include apache
    include php
    include mysql
}
