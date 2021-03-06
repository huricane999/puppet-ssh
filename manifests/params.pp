class ssh::params {
  case $::osfamily {
    'Debian': {
      $server_package_name = 'openssh-server'
      $server_package_install_options = undef
      $server_package_uninstall_options = undef
      $client_package_name = 'openssh-client'
      $client_package_install_options = undef
      $client_package_uninstall_options = undef
      $package_provider = undef
      $sshd_dir = '/etc/ssh'
      $sshd_config = '/etc/ssh/sshd_config'
      $ssh_config = '/etc/ssh/ssh_config'
      $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
      $service_name = 'ssh'
      $sftp_server_path = '/usr/lib/openssh/sftp-server'
    }
    'RedHat': {
      $server_package_name = 'openssh-server'
      $server_package_install_options = undef
      $server_package_uninstall_options = undef
      $client_package_name = 'openssh-clients'
      $client_package_install_options = undef
      $client_package_uninstall_options = undef
      $package_provider = undef
      $sshd_dir = '/etc/ssh'
      $sshd_config = '/etc/ssh/sshd_config'
      $ssh_config = '/etc/ssh/ssh_config'
      $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
      $service_name = 'sshd'
      $sftp_server_path = '/usr/libexec/openssh/sftp-server'
    }
    'FreeBSD', 'DragonFly': {
      $server_package_name = undef
      $server_package_install_options = undef
      $server_package_uninstall_options = undef
      $client_package_name = undef
      $client_package_install_options = undef
      $client_package_uninstall_options = undef
      $package_provider = undef
      $sshd_dir = '/etc/ssh'
      $sshd_config = '/etc/ssh/sshd_config'
      $ssh_config = '/etc/ssh/ssh_config'
      $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
      $service_name = 'sshd'
      $sftp_server_path = '/usr/libexec/sftp-server'
    }
    'OpenBSD': {
      $server_package_name = undef
      $server_package_install_options = undef
      $server_package_uninstall_options = undef
      $client_package_name = undef
      $client_package_install_options = undef
      $client_package_uninstall_options = undef
      $package_provider = undef
      $sshd_dir = '/etc/ssh'
      $sshd_config = '/etc/ssh/sshd_config'
      $ssh_config = '/etc/ssh/ssh_config'
      $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
      $service_name = 'sshd'
      $sftp_server_path = '/usr/libexec/sftp-server'
    }
    'Darwin': {
      $server_package_name = undef
      $server_package_install_options = undef
      $server_package_uninstall_options = undef
      $client_package_name = undef
      $client_package_install_options = undef
      $client_package_uninstall_options = undef
      $package_provider = undef
      $sshd_dir = '/etc'
      $sshd_config = '/etc/sshd_config'
      $ssh_config = '/etc/ssh_config'
      $ssh_known_hosts = '/etc/ssh_known_hosts'
      $service_name = 'com.openssh.sshd'
      $sftp_server_path = '/usr/libexec/sftp-server'
    }
    'windows': {
      $server_package_name = 'openssh'
      $server_package_install_options = ['/SSHServerFeature']
      $server_package_uninstall_options = ['/SSHServerFeature']
      $client_package_name = 'openssh'
      $client_package_install_options = undef
      $client_package_uninstall_options = undef
      $package_provider = 'chocolatey'
      $sshd_dir = 'C:/Program Files/OpenSSH-Win64'
      $sshd_config = 'C:/Program Files/OpenSSH-Win64/sshd_config'
      $ssh_config = 'C:/Program Files/OpenSSH-Win64/ssh_config'
      $ssh_known_hosts = 'C:/Program Files/OpenSSH-Win64/ssh_known_hosts'
      $service_name = 'sshd'
      $sftp_server_path = 'C:/Program Files/OpenSSH-Win64/sftp-server.exe'
    }
    'ArchLinux': {
      $server_package_name = 'openssh'
      $server_package_install_options = undef
      $server_package_uninstall_options = undef
      $client_package_name = 'openssh'
      $client_package_install_options = undef
      $client_package_uninstall_options = undef
      $package_provider = undef
      $sshd_dir = '/etc/ssh'
      $sshd_config = '/etc/ssh/sshd_config'
      $ssh_config = '/etc/ssh/ssh_config'
      $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
      $service_name = 'sshd.service'
      $sftp_server_path = '/usr/lib/ssh/sftp-server'
    }
    'Suse': {
      $server_package_name = 'openssh'
      $server_package_install_options = undef
      $server_package_uninstall_options = undef
      $client_package_name = 'openssh'
      $client_package_install_options = undef
      $client_package_uninstall_options = undef
      $package_provider = undef
      $sshd_dir = '/etc/ssh'
      $sshd_config = '/etc/ssh/sshd_config'
      $ssh_config = '/etc/ssh/ssh_config'
      $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
      case $::operatingsystem {
        'SLES': {
          $service_name = 'sshd'
          # $::operatingsystemmajrelease isn't available on e.g. SLES 10
          case $::operatingsystemrelease {
            /^10\./, /^11\./: {
              if ($::architecture == 'x86_64') {
                $sftp_server_path = '/usr/lib64/ssh/sftp-server'
              } else {
                $sftp_server_path = '/usr/lib/ssh/sftp-server'
              }
            }
            default: {
              $sftp_server_path = '/usr/lib/ssh/sftp-server'
            }
          }
        }
        'OpenSuse': {
          $service_name = 'sshd'
          $sftp_server_path = '/usr/lib/ssh/sftp-server'
        }
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
    'Solaris': {
      case $::operatingsystem {
        'SmartOS': {
          $server_package_name = undef
          $server_package_install_options = undef
          $server_package_uninstall_options = undef
          $client_package_name = undef
          $client_package_install_options = undef
          $client_package_uninstall_options = undef
          $package_provider = undef
          $sshd_dir = '/etc/ssh'
          $sshd_config = '/etc/ssh/sshd_config'
          $ssh_config = '/etc/ssh/ssh_config'
          $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
          $service_name = 'svc:/network/ssh:default'
          $sftp_server_path = 'internal-sftp'
        }
        default: {
          $sshd_dir = '/etc/ssh'
          $sshd_config = '/etc/ssh/sshd_config'
          $ssh_config = '/etc/ssh/ssh_config'
          $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
          $service_name = 'svc:/network/ssh:default'
          $sftp_server_path = 'internal-sftp'
          $server_package_install_options = undef
          $server_package_uninstall_options = undef
          $client_package_install_options = undef
          $client_package_uninstall_options = undef
          $package_provider = undef
          case versioncmp($::kernelrelease, '5.10') {
            1: {
              # Solaris 11 and later
              $server_package_name = '/service/network/ssh'
              $client_package_name = '/network/ssh'
            }
            0: {
              # Solaris 10
              $server_package_name = 'SUNWsshdu'
              $client_package_name = 'SUNWsshu'
            }
            default: {
              # Solaris 9 and earlier not supported
              fail("Unsupported platform: ${::osfamily}/${::kernelrelease}")
            }
          }
        }
      }
    }
    default: {
      case $::operatingsystem {
        'Gentoo': {
          $server_package_name = 'openssh'
          $server_package_install_options = undef
          $server_package_uninstall_options = undef
          $client_package_name = 'openssh'
          $client_package_install_options = undef
          $client_package_uninstall_options = undef
          $package_provider = undef
          $sshd_dir = '/etc/ssh'
          $sshd_config = '/etc/ssh/sshd_config'
          $ssh_config = '/etc/ssh/ssh_config'
          $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
          $service_name = 'sshd'
          $sftp_server_path = '/usr/lib/misc/sftp-server'
        }
        'Amazon': {
          $server_package_name = 'openssh-server'
          $server_package_install_options = undef
          $server_package_uninstall_options = undef
          $client_package_name = 'openssh-clients'
          $client_package_install_options = undef
          $client_package_uninstall_options = undef
          $package_provider = undef
          $sshd_dir = '/etc/ssh'
          $sshd_config = '/etc/ssh/sshd_config'
          $ssh_config = '/etc/ssh/ssh_config'
          $ssh_known_hosts = '/etc/ssh/ssh_known_hosts'
          $service_name = 'sshd'
          $sftp_server_path = '/usr/libexec/openssh/sftp-server'
        }
        default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
        }
      }
    }
  }

  # ssh & sshd default options:
  # - OpenBSD doesn't know about UsePAM
  # - Sun_SSH doesn't know about UsePAM & AcceptEnv; SendEnv & HashKnownHosts
  case $::osfamily {
    'OpenBSD': {
      $sshd_default_options = {
        'ChallengeResponseAuthentication' => 'no',
        'X11Forwarding'                   => 'yes',
        'PrintMotd'                       => 'no',
        'AcceptEnv'                       => 'LANG LC_*',
        'Subsystem'                       => "sftp ${sftp_server_path}",
      }
      $ssh_default_options = {
        'Host *'                 => {
          'SendEnv'              => 'LANG LC_*',
          'HashKnownHosts'       => 'yes',
        },
      }
    }
    'Solaris': {
      $sshd_default_options = {
        'ChallengeResponseAuthentication' => 'no',
        'X11Forwarding'                   => 'yes',
        'PrintMotd'                       => 'no',
        'Subsystem'                       => "sftp ${sftp_server_path}",
        'HostKey'                         => [
          "${sshd_dir}/ssh_host_rsa_key",
          "${sshd_dir}/ssh_host_dsa_key",
        ],
      }
      $ssh_default_options = { }
    }
    default: {
      $sshd_default_options = {
        'ChallengeResponseAuthentication' => 'no',
        'X11Forwarding'                   => 'yes',
        'PrintMotd'                       => 'no',
        'AcceptEnv'                       => 'LANG LC_*',
        'Subsystem'                       => "sftp ${sftp_server_path}",
        'UsePAM'                          => 'yes',
      }
      $ssh_default_options = {
        'Host *'                 => {
          'SendEnv'              => 'LANG LC_*',
          'HashKnownHosts'       => 'yes',
        },
      }
    }
  }

  $validate_sshd_file              = false
  $user_ssh_directory_default_mode = '0700'
  $user_ssh_config_default_mode    = '0600'
  $collect_enabled                 = true   # Collect sshkey resources
  $issue_net                       = '/etc/issue.net'
}
