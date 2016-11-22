# Pull base image  
FROM ubuntu:14.04  
  
MAINTAINER DreamTale "dreamtalewind@gmail.com"  
  
# update source  
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted"> /etc/apt/sources.list  
RUN apt-get update  
  
# Step 1. install ssh-server for debug
RUN apt-get install -y openssh-server
RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.sshd
# cancel the pam-loggin mode
RUN sed -ri 's/session required pam_loginuid.so/# session required pam_loginuid.so/g' /etc/pam.d/sshd
# add authorized file anf setup script
ADD authorized_keys /root/.ssh/authorized_keys
ADD run_ssh.sh /root/run.sh
RUN chmod u+x /root/run.sh
# expose ports
EXPOSE 22
#default command
CMD ["/root/run.sh"]
# ================================
# Step 2. use php, a php demo
WORKDIR root
RUN apt-get update
RUN apt-get -y install php5
RUN apt-get -y install libapache2-mod-php5
RUN apt-get -y install php5-gd
RUN mkdir -p /var/log/httpd
RUN mkdir -p /var/www/
RUN mkdir -p /var/www/html/
ENV TERM linux
# Enable Chinese
ENV LC_ALL en_US.UTF-8
EXPOSE 80
# =================================
# Step 3.use dokuwiki
WORKDIR root
# Add local dokuwiki to Doker
ADD dokuwiki /var/www/dokuwiki
RUN chown -R www-data:www-data /var/www/dokuwiki
# Exchange the default apache directory
RUN sed -ri 's/html/dokuwiki/g' /etc/apache2/sites-enabled/000*.conf
RUN sed -ri 's/AllowOverride None/AllowOverride All/g' /etc/apache2/sites-enabled/000*.conf

ADD run_php.sh /root/run_php.sh
RUN chmod u+x /root/run_php.sh
CMD /root/run_php.sh
