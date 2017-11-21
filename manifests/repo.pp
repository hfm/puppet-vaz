# Class: vaz::repo
# ===========================
#
# vaz::repo is to setup repository.
class vaz::repo (
  String $ensure = 'present',
  String $gpgkey_url = 'https://repo.veeta.org/gpg/GPG-KEY-vaz',
) {

  case $facts['os']['family'] {
    'RedHat': {
      yumrepo { 'vaz':
        ensure   => $ensure,
        descr    => 'vaz',
        baseurl  => 'http://repo.veeta.org/centos/$basearch',
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => $gpgkey_url,
      }
    }
    'Debian': {
      apt::source { 'vaz':
        location => 'http://repo.veeta.org/debian/',
        release  => 'vaz',
        repos    => 'main',
        key      => {
          id     => 'FB369DFBB565680BACBB5E86BA436689FC2D1244',
          source => $gpgkey_url,
        },
        include  => {
          deb    => true,
          source => false,
        }
      }
    }
    default: {
      fail("Unsupported os: ${facts['os']['name']}")
    }
  }

}
