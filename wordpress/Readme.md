# WORDPRESS Official Docker Image

![Wordpress Logo](https://d1q6f0aelx0por.cloudfront.net/product-logos/library-wordpress-logo.png)


### This would be an usefull example of how to bring up a docker container with vanilla wordpress.

[DockerHUB Container Link](https://hub.docker.com/_/wordpress)

## Adding additional libraries / extensions

This image does not provide any additional PHP extensions or other libraries, even if they are required by popular plugins (e.g. it cannot send e-mails).  
If you need additional PHP extensions, you'll need to create your own image FROM this one. 
The [documentation of the php image](https://github.com/docker-library/docs/blob/master/php/README.md#how-to-install-more-php-extensions) explains how to compile additional extensions.   
Additionally, [an older Dockerfile for wordpress](https://github.com/docker-library/wordpress/blob/618490d4bdff6c5774b84b717979bfe3d6ba8ad1/apache/Dockerfile#L5-L9)  has a simplified example of doing this and [a newer version of that same Dockerfile](https://github.com/docker-library/wordpress/blob/5bbbfa8909232af10ea3fea8b80302a6041a2d04/latest/php7.4/apache/Dockerfile#L18-L62) has a much more thorough example.  

## Include pre-installed themes / plugins

Mount the volume containing your themes or plugins to the proper directory; and then apply them through the "wp-admin" UI.   
Ensure read/write/execute permissions are in place for the user:  

   - Themes go in a subdirectory in /var/www/html/wp-content/themes/
   - Plugins go in a subdirectory in /var/www/html/wp-content/plugins/

If you wish to provide additional content in an image for deploying in multiple installations,   
place it in the same directories under /usr/src/wordpress/ instead (which gets copied to /var/www/html/ on the container's initial startup).
