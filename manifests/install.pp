# Class: vaz::client::install
# ===========================
#
# vaz::client::install is to install libnss-vaz and libpam-vaz files.

class vaz::install (
  String $package_ensure = 'present',
) {

  include vaz::repo

  $require = $facts['os']['family'] ? {
    'Debian' => Class['apt::update'],
    'RedHat' => Yumrepo['vaz'],
  }

  package { 'vaz':
    ensure  => $package_ensure,
    require => $require,
  }

}
