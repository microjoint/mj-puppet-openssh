#
class openssh (
  $config = lookup('openssh::config', {merge => 'hash', default_value => undef}),
  $package_name = lookup('openssh::package_name', String, 'unique', 'openssh' ),
  $package_ensure = lookup('openssh::package_ensure', String, 'unique', 'latest'),
  $service_ensure = lookup('openssh::service_ensure', String, 'unique', 'running'),
  $service_enable = lookup('openssh::service_enable', Boolean, 'unique', true),
  $service_name   = lookup('openssh::service_name', String, 'unique', 'ssh'),
  $port = lookup('openssh::port',Integer, 'unique',  22),
) {

  notice( "ssh port ${port}" )
  if $config {
    validate_hash( $config )
  }
  validate_string( $package_name )

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  anchor { 'openssh::begin': } ->
  class { '::openssh::install': } ->
  class { '::openssh::config': } ~>
  class { '::openssh::service': } ->
  anchor { 'openssh::end': }

}
