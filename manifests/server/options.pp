define ssh::server::options ($options, $order = 50) {
  concat::fragment { "options ${name}":
    target  => $ssh::params::sshd_config,
    content => regsubst(template("${module_name}/options.erb"),'\n',$ssh::params::newline,'EMG'),
    order   => 100+$order,
  }
}
