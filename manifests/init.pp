#
class openssh (
  $config = hiera('openssh::config', undef),
  $package_name = hiera('openssh::package_name', 'openssh'),
  $package_ensure = hiera('openssh::package_ensure', 'latest'),
  $service_ensure = hiera('openssh::service_ensure', 'running'),
  $service_enable = hiera('openssh::service_enable', true),
  $service_name   = hiera('openssh::service_name', 'ssh'),
  $port = hiera('openssh::port', 2222),
) {

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
