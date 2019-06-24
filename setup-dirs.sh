#!/bin/bash
# Script for setting up directories for Tomcat8 container adm
#
# Create directory structure that will be used for mounting in the container setup
# New directories added here as needed - don't have to mount all
[ -d c0 ] || mkdir c0
[ -d c0/lib ] || mkdir c0/lib
[ -d c0/cnf ] || mkdir c0/cnf
[ -d c0/wbap ] || mkdir c0/wbap
[ -d c0/wrk ] || mkdir c0/wrk
[ -d c0/logs ] || mkdir c0/logs
[ -d c0/apphome ] || mkdir c0/apphome





# Copy the basic structure with eventual content - this will always be executed
for i in {1..5}
do	 
   sudo rsync -axu c0/* c$i
done
