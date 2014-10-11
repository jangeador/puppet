class users {
	user { 'ubuntu':
  		ensure => 'present',
	}
	user { 'delio':
	    ensure => 'present',
	    groups => ['sudo', 'ubuntu'],
	    home => '/home/delio',
	    managehome => true,
	    password => '$6$lY2Gp3Cr$zNrUB7T3yibUF/gWn5cTQ0fNv7MUmx/DZuw3E7I..Vh9tITG28BtgvXJPU4Gm4Z/9oNvlbX24KzQ9Ib1QH1B9.',
	    shell => '/bin/bash',
	}

	file { '/home/delio':
	    ensure => directory,
	    owner => 'delio',
	    group => 'delio',
	    mode => 755,
	    source => 'puppet:///modules/users/delio',
	    recurse => remote,
	    require => User['delio'],
	}

	ssh_authorized_key { 'delio':
	    ensure => 'present',
	    user => 'delio',
	    type => 'rsa',
	    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCX3F94z5svWyiR5yjlZCx+HbjF6fVdnsioxFGdaXzGy3ZiluqzfkZwA9umdL5ZImOuTA/iYLdela6g/CUv98YJQ+y/BfwkS5ZNlC/KU/8Rj5UzDYP1VGXyoxNHeRBNlZ0xtwDW52hznzhmfGsJXcG99quoGyDZJR0G/RdJc+tQnm9voDLUxxCaADSGd/ijqKlLCsmSdgrlfxXkgGM7itK8VrVTCZl9+UY5QkywcDMipz/B5jZrOlnbjlOYjwIbVjU3J6vK3TGoukMyYEuUc+Ht8esk6GhLjuWP/UHLK2JgZ+YwuCqpY63QWwwRYuaFdZj1mY6Hvxr9dEFJMz4Xsr4V',
	}
}
