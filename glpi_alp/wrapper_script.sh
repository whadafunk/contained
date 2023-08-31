#!/bin/sh

  
# Start the cron process
crond -s
cron_pid=$!
echo "PID of crond is $cron_pid"

# Start the httpd process
httpd -DFOREGROUND
httpd_pid=$!
echo "PID of httpd is $httpd_pid"
  
# Wait for any process to exit
wait -n $cron_pid $httpd_pid
  

# Exit with status of process that exited first
exit $?

