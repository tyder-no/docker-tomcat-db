#!/bin/bash
# Script for starting and stopping Tomcat8 container 
#
#

#for i in {1..5}
#do	 
#   sudo rsync -axu c0/* c$i
#done

c_no=$1 ; oper=$2 ;
#tpath=/usr/local/tomcat
tpath=
#if

#echo  Command:  sudo docker run --name=tomcat${c_no} --rm -d -p 808${c_no}:8080 tyder/tomcat10113  $oper 

if [ ${c_no} -lt 1 ] 
then
    c_no=1
elif [ ${c_no} -gt 5 ]
then
    c_no=5
fi    

if [ $oper == 'start' ]
then
    echo  Start:  sudo docker run --name=tomcat${c_no} --rm  -d \
	  -v "$PWD"/c${c_no}/wrk:${tpath}/work -v "$PWD"/c${c_no}/apphome:${tpath}/apphome -v "$PWD"/c${c_no}/wbap:${tpath}/webapps \
	  -v "$PWD"/c${c_no}/cnf:${tpath}/conf  -v "$PWD"/c${c_no}/logs:${tpath}/logs  -v "$PWD"/c${c_no}/lib:/lib  \
          -p 808${c_no}:8080 tyder/tomcat10113  $oper
#    
    sudo docker run --name=tomcat${c_no} --rm  -d \
 	  -v "$PWD"/c${c_no}/wrk:/work -v "$PWD"/c${c_no}/apphome:/apphome -v "$PWD"/c${c_no}/wbap:/webapps \
	  -v "$PWD"/c${c_no}/cnf:/conf  -v "$PWD"/c${c_no}/logs:/logs -v "$PWD"/c${c_no}/lib:/tclib  \
          -p 808${c_no}:8080 tyder/tomcat10113  
   
elif [ $oper == 'stop' ]
then
    echo Stop: sudo docker stop tomcat${c_no}
    sudo docker stop tomcat${c_no}

else
    echo Bad operation argument: $oper, must be start or stop
fi    

#echo  Command:  sudo docker run --name=tomcat${c_no} --rm -d -p 808${c_no}:8080 tyder/tomcat10113  $oper 
#



#
