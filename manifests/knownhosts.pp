class ssh::knownhosts(
  $collect_enabled = $ssh::params::collect_enabled,
  $storeconfigs_group = undef,
) inherits ssh::params {
  if ($collect_enabled) {
    Sshkey {
      target => $ssh::params::ssh_known_hosts,
    }

    resources { 'sshkey':
      purge => true,
    }

    if $storeconfigs_group {
    Sshkey <<| tag == "hostkey_${storeconfigs_group}" |>>
    } else {
      Sshkey <<| |>>
    }
  }
}
