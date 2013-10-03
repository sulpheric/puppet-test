class ssh::params {
  case $operatingsystem {
	Solaris: {
      $ssh_package_name = 'openssh'
      }
    /(Ubuntu|Debian)/: {
      $ssh_package_name = 'openssh-server'
      $ssh_service_name = 'sshd'
      }
    /(RedHat|CentOS|Fedora)/: {
      $ssh_package_name = 'openssh-server'
      $ssh_service_name = 'sshd'
      }
   } 
}
