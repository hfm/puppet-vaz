# Class: vaz::config
# ===========================
#
# vaz::server::config is to configure vaz.

class vaz::config (
  String $service = $vaz::service,
  String $token = $vaz::token,
) {

  file { '/etc/vaz.conf':
    content => template('vaz/vaz.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
