node default {

vcsrepo { '/root/flask-docker':
        ensure   => present,
        provider => git,
        source   => 'https://github.com/nickage87/flask-docker.git',
}
vcsrepo { '/root/flask-app':
        ensure   => present,
        provider => git,
        source   => 'https://github.com/nickage87/flask-app.git',
}
docker::image {'nickage87/flask-app:1.0':
        docker_file     => '/root/Dockerfile',
        subscribe      => [
                                File['/root/Dockerfile'],
                                File['/root/flaskapp.py'],
                        ],
}
file {'/root/Dockerfile':
        source  =>      "file:///root/flask-docker/Dockerfile",
}
file {'/root/flaskapp.py':
        source  =>      "file:///root/flask-app/flaskapp.py",
}
docker::run {'flask-app-1.0':
        image           => 'nickage87/flask-app:1.0',
        restart_service => false,
        privileged      => false,
        pull_on_start   => true,
        ports           => [ '80:80' ],
        expose          => [ '80' ],

}
}
