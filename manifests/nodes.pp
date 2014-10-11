node default {
	include users
	include ssh
	include postgres
	include git

	file { '/usr/local/app':
	    ensure => directory,
	    owner => 'delio',
	    group => 'delio',
	    mode => 755,
	}

	git::clone { 'jangeador/django-sample':
	    path => '/usr/local/app',
	    dir => 'django',
	}
}