class ssh::knownhosts(
  $collect_enabled = $ssh::params::collect_enabled,
  $storeconfigs_group = undef,
) inherits ssh::params {
  if ($collect_enabled) {
    resources { 'ssh::sshkey':
      purge => true,
    }

    if $storeconfigs_group {
      Ssh::Sshkey <<| tag == "hostkey_${storeconfigs_group}" |>>
    } else {
      Ssh::Sshkey <<| |>>
    }
  }
}
