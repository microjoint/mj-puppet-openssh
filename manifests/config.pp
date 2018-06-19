#
class openssh::config {
  if ( $openssh::config ) {
    create_resources( file, $config )
  }

  file{ '/etc/ssh/sshd_config':
    ensure  => file,
    content => epp('openssh/sshd_config.epp'),
  }
}
