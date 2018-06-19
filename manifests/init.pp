#
class openssh (
  $config = lookup('openssh::config', {merge => 'hash', default_value => undef}),
  $package_name = lookup('openssh::package_name', String, 'unique', 'openssh' ),
  $package_ensure = lookup('openssh::package_ensure', String, 'unique', 'latest'),
  $service_ensure = lookup('openssh::service_ensure', String, 'unique', 'running'),
  $service_enable = lookup('openssh::service_enable', Boolean, 'unique', true),
  $service_name   = lookup('openssh::service_name', String, 'unique', 'ssh'),
  #$port = lookup('openssh::port',Integer, 'unique',  22),
  Integer[0, 65535] $port
) {

  if $config {
    validate_hash( $config )
  }

  contain openssh::install
  contain openssh::config
  contain openssh::service

  Class['::openssh::install'] ->
  Class['::openssh::config'] ~>
  Class['::openssh::service']

}
