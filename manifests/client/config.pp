class ssh::client::config
{
  $options = $::ssh::client::merged_options
  $use_augeas = $::ssh::client::use_augeas

  if $use_augeas {

    create_resources('ssh_config', $options)

  } else {
    file { $ssh::params::ssh_config:
      ensure  => present,
      owner   => $ssh::params::fileowner,
      group   => $ssh::params::filegroup,
      mode    => $ssh::params::pubfilemode,
      content => regsubst(template("${module_name}/ssh_config.erb"),'\n',$ssh::params::newline,'EMG'),
      require => Class['ssh::client::install'],
    }
  }

  # Workaround for https://tickets.puppetlabs.com/browse/PUP-1177.
  # Fixed in Puppet 3.7.0
  if versioncmp($::puppetversion, '3.7.0') < 0 {
    ensure_resource('file', $ssh::ssh_known_hosts, {
      'ensure' => 'file',
      'owner'  => $ssh::params::fileowner,
      'group'  => $ssh::params::filegroup,
      'mode'   => $ssh::params::pubfilemode,
    })
  }
}
