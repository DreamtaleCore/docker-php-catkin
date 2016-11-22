#! /bin/bash

# copy the dokuwiki from the path we installed
cp -a /var/www/dokuwiki .
# change the logo images
cp bit-logos/dokuwiki-128.png dokuwiki/data/media/wiki/dokuwiki-128.png
cp bit-logos/logo.png dokuwiki/lib/tpl/dokuwiki/images/logo.png
cp bit-logos/logo.png dokuwiki/data/cache/1/13c634a1631feaa9123f303d4a3e5a77.media.50x50.png
cp bit-logos/favicon.ico dokuwiki/lib/tpl/dokuwiki/images/favicon.ico
cp bit-logos/apple-touch-icon.png dokuwiki/lib/tpl/dokuwiki/images/apple-touch-icon.png
# build the docker-file
sudo docker build -t php-catkin .
