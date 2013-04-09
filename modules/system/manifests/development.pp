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

    exec { "/usr/bin/gem install rake":
      onlyif  => "/usr/bin/gem list | grep -ci rake",
      require => Package["rubygems"],
    }
}
