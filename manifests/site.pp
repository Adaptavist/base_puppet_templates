# global path for exec
Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

node default {

# This is in leu of a for each construct - role can be a scalar an array
  hiera_include('classes')
}
