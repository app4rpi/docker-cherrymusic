# Create docker image with cherrymusic over cherrypi on Alpine and run it in a Docker container
## 1. Create the working directory and the configuration files

```
$ mkdir cherrymusic && cd cherrymusic
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
