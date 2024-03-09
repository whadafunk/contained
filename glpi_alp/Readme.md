# GLPI Container Instructions

In the late versions GLPI recommends to store some files and folders outside of the htdocs / Document root folder.
The start script mount persistent the following:


downstream.php - defines the config folder /etc/glpi and the localdefine.php
/etc/glpi - is mounted from glpi_conf
/var/lib/glpi - is mounted from $(pwd)/glpi_data (originally is a folder called files under htdocs)
/var/log/glpi - is mounted from $(pwd)/log/glpi
the paths for data and log are taken from localdefine.php


There is another file that will be created inside /etc/glpi and that is the db_settings.conf (or something like that).
When you first start the file is not there, but if you go through the setup wizzard it will be created


The container itself is not doing much. Just adding the crontabs and the entrypoing script
