#
class openssh::service inherits openssh {
  if ! ($openssh::service_ensure in ['running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  service { 'openssh':
    ensure     => $openssh::service_ensure,
    enable     => $openssh::service_enable,
    name       => $openssh::service_name,
    hasstatus  => true,
    hasrestart => true,
  }
}
