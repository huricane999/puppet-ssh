# This sits in front of sshkey so that we can adjust the target path
# according to the needs of the local OS.
class ssh::sshkey(
  $ensure = undef,
  $host_aliases = undef,
  $key = undef,
  $provider = undef,
  $type = undef,
) {
  sshkey { $name:
    ensure       => $ensure,
    host_aliases => $host_aliases,
    key          => $key,
    provider     => $provider,
    type         => $type,
    target       => $ssh::params::ssh_known_hosts,
  }
}
