#
class openssh::service inherits openssh {
  if ! ($openssh::service_ensure in ['running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  firewall { '100 allow openssh':
    chain  => 'INPUT',
    state  => ['NEW'],
    source => ['10.180.117.234']
    dport  => $openssh::port,
    proto  => 'tcp',
    action => 'accept',
  }

  service { 'openssh':
    ensure     => $openssh::service_ensure,
    enable     => $openssh::service_enable,
    name       => $openssh::service_name,
    hasstatus  => true,
    hasrestart => true,
  }
}
