class git{
    include git::install
}

class git::install{
    package { 'git:':
        ensure => present
    }
}

define git::clone ( $path, $dir){
    exec { "clone-$name-$path":
    	user => 'delio',
        command => "/usr/bin/git clone git@github.com:$name $path/$dir",
        creates => "$path/$dir",
        require => [Class["git"], File[$path]],
    }
}
