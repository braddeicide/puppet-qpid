# == Define: qpid::router::ssl_profile
#
# Configures an SSL profile for Qpid Dispatch Router
#
# == Parameters
#
# $ca::         Location of CA pem file
#
# $cert::       Location of certificate pem file
#
# $key::        Location of private key pem file
#
# $name::       Name of SSL profile
#
# $password::   Password, if required
#
define qpid::router::ssl_profile(
  $ca,
  $cert,
  $key,
  $password      = undef,
) {

  validate_absolute_path($ca, $cert, $key)

  concat::fragment {"qdrouter+ssl_${title}.conf":
    target  => $qpid::router::config_file,
    content => template('qpid/router/ssl_profile.conf.erb'),
    order   => '02',
  }

}
