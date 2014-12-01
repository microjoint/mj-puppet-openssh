#
class openssh::params {
  $config         = undef
  $package_name   = 'openssh-server' #debian
  $package_ensure = 'latest'
  $service_ensure = 'running'
  $service_enable = true
  $service_name   = 'ssh'
}
