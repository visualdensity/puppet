class development inherits foundation
{
    package { "zsh":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }

    package { "tmux":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }

    package { "iotop":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }

    package { "ruby":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }

    package { "rubygems":
        ensure  => installed,
        require => Package["ruby"],
    }

}
