# Create docker image with cherrymusic over cherrypi on Alpine and run it in a Docker container
## 1. Create the working directory and the configuration files

```
$ git clone https://github.com/app4rpi/docker-cherrymusic.git
$ mkdir docker-cherrymusic && cd docker-cherrymusic
$ nano Dockerfile
$ nano entrypoint.sh
```
## 2. Create a docker image

``` 
$ docker build --rm -t docker-cherrymusic .
```

The image docker-minidlna:latest has been created with a size of 43.1MB

## 3a. Run cherrymusic in a container

```
$ docker run -d --name cherrymusic --net=host -v /var/media:/media docker-cherrymusic:latest
```

## 3b. Run cherrymusic in a container and start automatically


$ docker run -d --restart always --name cherrymusic --net=host -v /var/media:/media docker-cherrymusic:latest


## Configuration of Music Directory
The configuration file of the program that is fixed when compiling the image is cherrymusic.conf.
The port of service has been fixed at 8080
The data directory is set to "/media/music"

To set access to media music files outside the container, use the --volume option

```
docker run -d --name cherrymusic --net=host -v /var/media:/media/musica  docker-cherrymusic:latest
```
## Access to removable drives
To set removable units at the same insertion point, they must be registered in /etc/fstab. 
To see units and parameters use the instructions: blkid - df - cat /etc/fstab
To automate the process it is possible to use the utility: https://gist.github.com/app4rpi/676be70e0774cbc2da0eb89234ecc0c3
