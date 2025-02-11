#FROM devopsedu/webapp
FROM rrgit101/projcert

MAINTAINER Karina Hallberg <kamor23375923@gmail.com>

#Update Repository
RUN apt-get update -y

#Install Apache
RUN apt-get install -y apache2

#Install PHP Modules
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

#Copy Application Files
RUN rm -rf /var/www/html/*
RUN mkdir /var/www/html/template
RUN mkdir /var/www/html/content
COPY config.php /var/www/html
COPY functions.php /var/www/html
COPY index.php /var/www/html
COPY template.php /var/www/html/template
COPY content/404.php  /var/www/html/content
COPY content/about-us.php  /var/www/html/content
COPY contact.php  /var/www/html/content
COPY content/home.php  /var/www/html/content
COPY content/products.php  /var/www/html/content

#Open port 80
EXPOSE 80

#Start Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
