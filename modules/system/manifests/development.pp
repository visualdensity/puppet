class development inherits foundation
{
    package { "zsh":
        ensure  => installed,
        require => Exec["/usr/bin/apt-get update"],
    }
}
