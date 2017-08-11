class ssh::server::config {
  $options = $::ssh::server::merged_options

  case $ssh::server::validate_sshd_file {
    true: {
      $sshd_validate_cmd = '/usr/sbin/sshd -tf %'
    }
    default: {
      $sshd_validate_cmd = undef
    }
  }

  if $::ssh::server::use_augeas {
    create_resources('sshd_config', $options)
  } else {
    concat { $ssh::params::sshd_config:
      ensure       => present,
      owner        => $ssh::params::fileowner,
      group        => $ssh::params::filegroup,
      mode         => $ssh::params::prvfilemode,
      validate_cmd => $sshd_validate_cmd,
      notify       => Service[$ssh::params::service_name],
    }

    concat::fragment { 'global config':
      target  => $ssh::params::sshd_config,
      content => regsubst(template("${module_name}/sshd_config.erb"), '\n', $ssh::params::newline,'EMG'),
      order   => '00',
    }
  }

  if $::ssh::server::use_issue_net {
    file { $ssh::params::issue_net:
      ensure  => present,
      owner   => $ssh::params::fileowner,
      group   => $ssh::params::filegroup,
      mode    => $ssh::params::pubfilemode,
      content => regsubst(template("${module_name}/issue.net.erb"),'\n',$ssh::params::newline,'EMG'),
      notify  => Service[$ssh::params::service_name],
    }

    concat::fragment { 'banner file':
      target  => $ssh::params::sshd_config,
      content => "Banner ${ssh::params::issue_net}\n",
      order   => '01',
    }
  }
}
