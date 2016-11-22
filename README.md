# dokcer image for dokuwiki
* * *
## How to build
_NOTICE:_

First of all, make your system support and have installed ``Docker``, 
or look this [page](https://docs.docker.com/engine/getstarted/ title="tutorial")

In this package, you need **adjust** some ``files`` or ``files' path`` in the ``build.sh``

Step 1. Make sure the path of your dokuwiki, then open the build.sh:

   ``` bash
   gedit build.sh
   ```

   find the code as below:

   ``` bash
   cp -a /var/www/dokuwiki .
   ```

   and change the line like below:

   ``` bash
   cp -a <your path>/dokuwiki .
   ```

Step 2. Change the logo pictures as you wish

   All _logo files_ are storaged in the folder named ``bit-logos``, so you can change the images what you want. **A feature: ** the real logo image of dokuwiki is named ``13c634a1631feaa9123f303d4a3e5a77.media.50x50.png``, so remember change it as what the logo do. and, most importantly, keep the image's filename still.

Step 3. You can change you docker image name as below:

   open the ``build.sh`` and change this line

   ``` bash
   sudo docker build -t php-catkin .
   ```
   to

   ``` bash
   sudo docker build -t <your docker name> .
   ```

Step 4. Just start to build! type the command in the path of ``build.sh``

   ``` bash
   sudo ./build.sh
   ```

Step 5. So, we can run this image:

   ``` bash
   sudo service docker restart
   ```

   and then

   ``` bash
   sudo docker run -d -p 8090:80 php-catkin
   ```

   or as your settings:

   ``` bash
   sudo docker run -d -p <the port you like> <your docker image name>
   ```