VERSION=`head -n 1 Dockerfile | awk 'BEGIN{FS=":"}{print $2}'`

#VERSION=`docker images | grep alpine-wireguard | awk '{print $2}' | awk 'BEGIN{FS="."}{print $NF}'
#if 
#LOCALVERSION=$(( $SUBVERSION + 1))`


sudo docker build --tag alpine-wireguard:$VERSION.0 .

