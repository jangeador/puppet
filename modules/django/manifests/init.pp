class django {
    include django::environment, django::install
}

class django::install {
    package { [ "python", "python-dev", "python-virtualenv", "python-pip",
                "python-psycopg2", "python-imaging"]:
        ensure => present,
    }
}

class django::environment {
        django::virtualenv{ 've':
            path => '/usr/local/app',
        }
    }

define django::virtualenv( $path ){
     exec { "create-ve-$path":
         command => "/usr/bin/virtualenv -q $name",
         cwd => $path,
         creates => "$path/$name",
         require => [Class["django::install"]],
     }
}
