class ssh::client::install {
  if $ssh::params::client_package_name {
    if !defined(Package[$ssh::params::client_package_name]) {
      package { $ssh::params::client_package_name:
        ensure            => $ssh::client::ensure,
        provider          => $ssh::params::package_provider,
        install_options   => $ssh::params::client_package_install_options,
        uninstall_options => $ssh::params::client_package_uninstall_options,
      }
    }
  }
}
