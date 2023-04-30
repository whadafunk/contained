FROM php:8.2-alpine3.16
MAINTAINER gri.daniel@gmail.com
LABEL my_name="daniel grigore"
LABEL my_youtube="https://www.youtube.com/@routerologyblog1111"

# Apache and PHP on Alpine Linux

# Start with installing some generic tools that can help us with troubleshooting

RUN apk update && \
	apk add \
	net-tools \
	vim \
	tcpdump \
	ca-certificates \
	iproute2 \
	wget

# PHP official container from docker comes with a couple of extensions preinstalled
# To add supplementary extensions we can use the docker-php-ext-install and docker-php-ext-configure scripts

# Before running the scripts that will compile our extensions we need to add the required libraries

RUN 	apk add \
	libc-dev \
#	&& docker-php-ext-install bcmath \
#	&& apk add libzip-dev bzip2-dev \
#	&& docker-php-ext-install bz2 \
#	&& docker-php-ext-install zip \
#	&& apk add enchant2-dev \
#	&& docker-php-ext-install enchant \
#	&& docker-php-ext-install dba \
#	&& docker-php-ext-install exif \
	&& apk add libpng-dev \
	&& docker-php-ext-install gd \
#	&& apk add gmp-dev \
#	&& docker-php-ext-install gmp \
#	&& docker-php-ext-install gettext \
#	&& apk add imap-dev openssl-dev krb5-dev \
#	&& docker-php-ext-configure imap --with-imap-ssl --with-kerberos \
#	&& docker-php-ext-install imap \
#	&& apk add icu-dev \
#	&& docker-php-ext-install intl \
#	&& apk add openldap-dev \
#	&& docker-php-ext-install ldap \
#	&& docker-php-ext-install mysqli \
#	&& docker-php-ext-install opcache \
#	&& docker-php-ext-install pcntl \
#	&& docker-php-ext-install pdo \
#	&& docker-php-ext-install pdo_mysql \
#	&& apk add aspell-dev \
#	&& docker-php-ext-install pspell \
#	&& docker-php-ext-install shmop \
#	&& apk add libxml2-dev \
#	&& docker-php-ext-install simplexml \
#	&& docker-php-ext-install xml \
#	&& apk add net-snmp-dev \
#	&& docker-php-ext-install snmp \
#	&& docker-php-ext-install soap \
#	&& docker-php-ext-install sockets \
#	&& apk add tidyhtml-dev \
#	&& docker-php-ext-install tidy \
#	&& apk add libxslt-dev \
#	&& docker-php-ext-install xsl \
#	&& apk add oniguruma-dev \
#	&& docker-php-ext-install mbstring \
#	&& docker-php-ext-install sodium \
#	&& docker-php-ext-install calendar \
 	&& rm -rf /var/lib/apt/lists/* 

RUN apk add \
	apache2 \
	apache2-ssl \
	apache2-utils \
	&& rm -rf /var/lib/apt/lists/*

# Add our ca to the trusted ssl chain
#COPY ssl/*.crt /usr/local/share/ca-certificates
#RUN update-ca-certificates

# Set the correct timezone

# Configure php, although I recommend that you mount your php.ini at runtime
#COPY ini/php.ini $PHP_INI_DIR/

#COPY www/ /var/www/html

# Configure apache2, although I recommend that you mount your apache config at runtime
#COPY apache2.conf /etc/apache2/

# Enable our apache2 modules
#RUN 	a2enmod rewrite && 
#	a2enmod ssl




# We are running just the default site from /var/www, on http port 80/TCP
#COPY 000-default.conf /etc/apache2/sites-available/
#RUN     a2ensite 000-default

ENTRYPOINT ["httpd","-DFOREGROUND"]

