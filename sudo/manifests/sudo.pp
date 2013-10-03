class sudo {

$group = "%testgroup"
     	# Specifying the group that needs sudo permission.
	# this also can be a user, but without the % symbol
 
 augeas  
{
  "/etc/sudoers":
    context => "/files",
    # This is for mentioning the scope and type of input
         changes => [
                "set etc/sudoers/spec[last()+1]/user $group",
                "set etc/sudoers/spec[last()]/host_group/host ALL",
                "set etc/sudoers/spec[last()]/host_group/command ALL",
                "set etc/sudoers/spec[last()]/host_group/command/runas_user ALL",
               ],
 onlyif => "get etc/sudoers/spec[last()]/user != $group"
 }
}
