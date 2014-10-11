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

	git::clone_url { 'git://github.com/jangeador/django_sample.git':
	    path => '/usr/local/app',
	    dir => 'django',
	}
}