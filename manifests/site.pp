# global path for exec
Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

node default {
  # if we have a hiera hash of pre-stage classes, define the stage and make it run before main
  $pre_classes = hiera_array('pre_stage_classes')
  if ($pre_classes) {
    # define that pre stage runs before main
    stage { 'pre':
      before => Stage["main"],
    }

    # tag any pre classes as belonging to that stage
    class { $pre_classes:
      stage => 'pre'
    }
  }

  # This is in leu of a for each construct - role can be a scalar an array
  hiera_include('classes')
}
