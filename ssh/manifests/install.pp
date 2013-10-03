class ssh::install {
	package { "ssh":
  	name =>  $operatingsystem ? {
    	default => "openssh-server",
    	Solaris => "openssh" },
    	ensure => installed,
	}
}
