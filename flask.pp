node flask-host {

docker::image {'nickage87/flask-app:1.0':
        docker_file     => '/root/flask-docker/Dockerfile',
        #subscribe      => File['/root/flask-docker/Dockerfile'],
}

include docker

}
