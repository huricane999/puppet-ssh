class ssh::server::install {
  include ::ssh::params
  if $ssh::params::server_package_name {
    if !defined(Package[$ssh::params::server_package_name]) {
      package { $ssh::params::server_package_name:
        ensure            => $ssh::server::ensure,
        provider          => $ssh::params::package_provider,
        install_options   => $ssh::params::server_package_install_options,
        uninstall_options => $ssh::params::server_package_uninstall_options,
      }
    }
  }
}
