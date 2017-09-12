node default {

#vcsrepo { 'flask-app':
#	ensure   => present,
#	provider => git,
#	source   => 'git@github.com:nickage87/flask-docker.git',
#}
docker::image {'nickage87/flask-app:1.0':
        docker_file     => '/root/flask-docker/Dockerfile',
        subscribe      => File['/root/Dockerfile'],
}
file {'/root/Dockerfile':
	source => "https://github.com/nickage87/flask-docker/blob/master/Dockerfile",
}
docker::run {'flask-app-1.0':
	image           => 'nickage87/flask-app:1.0',
	restart_service => true,
	privileged      => false,
	pull_on_start   => false,
	ports           => [ '80:80' ],
	expose          => [ '80' ],

}

#include docker

}
