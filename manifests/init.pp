#
class openssh (
  $config         = $openssh::params::config,
  $package_name   = $openssh::params::package_name,
  $service_ensure = $openssh::params::service_ensure,
  $service_enable = $openssh::params::service_enable,
  $service_name   = $openssh::params::service_name,
) inherits openssh::params {

  # if $config {
  #   validate_hash( $config )
  # }

  # Anchor this as per #8040 - this ensures that classes won't float off and
  # mess everything up.  You can read about this at:
  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'openssh::begin': } ->
  class { '::openssh::install': } ->
  class { '::openssh::config': } ~>
  class { '::openssh::service': } ->
  anchor { 'openssh::end': }
}
