FROM hypriot/rpi-alpine
MAINTAINER app4rpi <app4rpi@outlook.com>
#
RUN apk update
RUN apk add --no-cache bash python3
RUN apk add --no-cache git
#
RUN git clone https://github.com/cherrypy/cherrypy
RUN cd /cherrypy && python3 setup.py install
RUN cd / && git clone git://github.com/devsnd/cherrymusic.git
WORKDIR /cherrymusic
RUN python3 setup.py install
RUN python3 cherrymusic
RUN mkdir /media/musica
#
RUN rm -rf /var/cache/apk/*
RUN sed -ri "s/basedir = None/basedir = \/media\/musica/g" /root/.config/cherrymusic/cherrymusic.conf
#
EXPOSE 8080
#
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
