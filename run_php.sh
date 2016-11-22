#!/bin/bash
# start apache
/etc/init.d/apache2 start
while [[ true ]]; do
	sleep 1000;
done