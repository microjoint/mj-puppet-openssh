#
class openssh::service inherits openssh {
  # if ! ($service_ensure in ['running', 'stopped' ]) {
  #   fail('service_ensure parameter must be running or stopped')
  # }

  if $service_manage == true {
    service { 'openssh':
      ensure     => $service_ensure,
      enable     => $service_enable,
      name       => $service_name,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
