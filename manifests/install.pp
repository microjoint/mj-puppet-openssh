#
class openssh::install inherits openssh {
  
  package { $package_name:
    ensure => $package_ensure,
  }
}
