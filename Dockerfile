FROM alpine:3.15.2
MAINTAINER climent

# additional files
##################

# add supervisor conf file
ADD run/supervisor.conf /etc/supervisor.conf
ADD run/wireguard.conf /etc/supervisor/conf.d/

# add install bash scripts
ADD build/install?.sh /root/

# add init.sh script
ADD build/init.sh /usr/local/bin

ADD run/usr.local.bin/*.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/*.sh

# add bash
RUN ["/sbin/apk", "add", "--no-cache", "bash"]

# install everything else for the base image.
# note, do not line wrap the below command, as it will fail looking for /bin/sh
RUN ["/bin/bash", "/root/install1.sh"]
RUN ["/bin/bash", "/root/install2.sh"]
RUN ["/bin/bash", "/root/install3.sh"]

# env
#####

# set environment variables for user nobody
ENV HOME /home/nobody

# set environment variable for terminal
ENV TERM xterm

# set environment variables for language
ENV LANG en_US.UTF-8

# docker settings
#################

# map /config to host defined config path (used to store configuration from app)
VOLUME /config

# map /data to host defined data path (used to store data from app)
VOLUME /data

# expose port for privoxy
EXPOSE 8118

# run tini to manage graceful exit and zombie reaping
ENTRYPOINT ["/sbin/tini", "-g", "--"]

# run script to set uid, gid and permissions
CMD ["/bin/bash", "/usr/local/bin/init.sh"]
