# Class: vaz::server::service
# ===========================
#
# vaz::server::service is to manage service of vaz.

class vaz::service (
  String $ensure = 'running',
  Boolean $enable = true,
) {

  service { 'vaz':
    ensure => $ensure,
    enable => $enable,
  }

}
