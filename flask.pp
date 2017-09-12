node default {

#vcsrepo { 'flask-app':
#	ensure   => present,
#	provider => git,
#	source   => 'git@github.com:nickage87/flask-docker.git',
#}
docker::image {'nickage87/flask-app:1.0':
        docker_file     => '/root/Dockerfile',
        subscribe      => [
				File['/root/Dockerfile'],
				File['/root/flaskapp.py'],
			],
}
file {'/root/Dockerfile':
	source	=> "https://raw.githubusercontent.com/nickage87/flask-docker/master/Dockerfile",
}
file {'/root/flaskapp.py':
	source	=> "https://raw.githubusercontent.com/nickage87/flask-app/master/flaskapp.py", 
}
docker::run {'flask-app-1.0':
	image           => 'nickage87/flask-app:1.0',
	restart_service => true,
	privileged      => false,
	pull_on_start   => true,
	ports           => [ '80:80' ],
	expose          => [ '80' ],

}

#include docker

}
