#
class openssh::config {
  if ( $config ) {
    create_resources( file, $config )
  }

  file{ '/etc/ssh/sshd_config':
    ensure  => file,
    content => template('openssh/sshd_config.erb'),
  }
}
