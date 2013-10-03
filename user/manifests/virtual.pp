# Create Users, define Authorized Keys and place Pub key in /etc/ssh/trust/<username>.pubkey
class user::virtual {
 define ssh_user($key) {
  user { $name:
   ensure	=> present,
   managehome	=> true,
   groups       => ["wheel","guest"],
   shell        => "/bin/bash",
   }

  file { "/etc/ssh/trust/${name}.pubkey":
   ensure 	=> file,
   mode 	=> 644,
   content 	=> $key,
   }
 
}

 @ssh_user { 'usertester':
   key		=> 'AAAAB3NzaC1yc2EAAAABIwAAAIEA3ATqENg+GWACa2BzeqTdGnJhNoBer8x6pfWkzNzeM8Zx7/2Tf2pl7kHdbsiTXEUawqzXZQtZzt/j3Oya+PZjcRpWNRzprSmd2UxEEPTqDw9LqY5S2B8og/NyzWaIYPsKoatcgC7VgYHplcTbzEhGu8BsoEVBGYu3IRy5RkAcZik='
   }

 @ssh_user { 'phate':
   key		=> 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC8zVzYqiEaf2PieqOgH+0XFogzZw6fUMZE+cjF/fd6siNrFkwuT5YwzCL88fD5nSNc52uRjAJBJwzC/25qLPV48UXJKZXzsDNUOgnhJ2Wsa1ZJsJnnlAIwVU1J3b5dMOCt7Di8eoVcYCzVvDh936YBcj0HT1ZQ1geTw5jijHhnO+j0Fab3JIl33UlXv6K7aQvZzueiFV8ycI/xAy+7fBWHzQt5JIt9mjn84pmo+YvgoVbMs+oPfRpbB5qMwpo/rg+j2jlLuc5XmdRVUJyFgTG+TpU/UjWpbw6yY8jF4y2y3TiudrCrSRotkii3qAIp5HM74g8Vl1MFrEgyCC+uLcg9'
   }

}
