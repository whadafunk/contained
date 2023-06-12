from php:8.0.24RC1-apache-bullseye
MAINTAINER gri.daniel@gmail.com

RUN apt-get update && apt-get install -y \
	apt-utils \
	net-tools \
	vim \
	tcpdump \
	ca-certificates \
	iproute2


RUN apt-get install -y \
	libbz2-dev \
	libenchant-2-dev \
	libgmp-dev \
	libc-client-dev \
	libkrb5-dev \
	libicu-dev \
	libldap2-dev \
	libpspell-dev \
	libxml2-dev \
	libsnmp-dev \
	libtidy-dev \
	libxslt1-dev \
	libzip-dev \
	libjpeg-dev \
	libpng-dev \
 	&& rm -rf /var/lib/apt/lists/* \
 	&& docker-php-ext-install bcmath \
	&& docker-php-ext-install bz2 \
	&& docker-php-ext-install dba \
	&& docker-php-ext-install enchant \
	&& docker-php-ext-install exif \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install gettext \
	&& docker-php-ext-install gmp \
	&& docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
	&& docker-php-ext-install imap \
	&& docker-php-ext-install intl \
	&& docker-php-ext-install ldap \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install opcache \
	&& docker-php-ext-install pcntl \
	&& docker-php-ext-install pdo \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install pspell \
	&& docker-php-ext-install shmop \
	&& docker-php-ext-install simplexml \
	&& docker-php-ext-install snmp \
	&& docker-php-ext-install soap \
	&& docker-php-ext-install sockets \
	&& docker-php-ext-install tidy \
	&& docker-php-ext-install xsl \
	&& docker-php-ext-install zip

# Cleaning up the repository indexes
RUN rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

# Add corp-CA as a trusted authority
COPY ssl/_.bit-soft.ro.crt /usr/local/share/ca-certificates
RUN update-ca-certificates

# Set the correct timezone


# Minor configuration to the apache and php
COPY php.ini /usr/local/etc/php/
COPY apache2.conf /etc/apache2/

# We are running just the default site from /var/www, on http port 80/TCP
COPY 000-default.conf /etc/apache2/sites-available/
RUN     a2ensite 000-default


# Enable our apache2 modules
RUN 	a2enmod rewrite && \
	a2enmod ssl
