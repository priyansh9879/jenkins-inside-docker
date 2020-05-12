#!/usr/bin/bash

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +       Program for Deploying Jenkins Server inside Docker Container        +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo
echo Enter the name you want to give to your jenkins Server
read input
echo
echo "Enter the port at which you want to launch your Jenkins Server (Eg- 81)"
echo "Note: Don't try to use port 80 as it will cause some conflict in your system."
read port
echo
sleep 4s
echo =============================================================================
echo         Pulling priyansh9879/centos-jenkins:7 Image from DockerHub
echo =============================================================================
echo
sleep 4s
if docker images | grep priyansh9879/centos-jenkins > /dev/null 2>&1
then
	echo =============================================================================
	echo        Docker Image priyansh9879/centos-jenkins:7 is already Present
	echo =============================================================================
else
	docker pull priyansh9879/centos-jenkins:7 > /dev/null 2>&1
	echo =============================================================================
	echo                           Download Successfull
	echo =============================================================================
fi
sleep 4s
echo
echo =============================================================================
echo           Building Container with the name $input. Please wait
echo =============================================================================

if [ $(docker run -dit --name $input --privileged -expose -p 80$port:8080 -v /:/host priyansh9879/centos-jenkins:7 > /dev/null 2>&1; echo $?) = "0" ];
then
	sleep 120s
	docker run -dit --name $input --privileged -expose -p 80$port:8080 -v /:/host priyansh9879/centos-jenkins:7 > /dev/null 2>&1
	echo
	echo =============================================================================
	echo     Container is successfully made with the name $input on port 80$port
	echo =============================================================================
	echo
elif [ $(docker run -dit --name $input --privileged -expose -p 80$port:8080 -v /:/host priyansh9879/centos-jenkins:7 > /dev/null 2>&1; echo $?) = "125" ];
then
	sleep 10s
	echo
	echo =============================================================================
	echo Container already present with the name $input. Rerun the script again and
	echo choose other name than $input
	echo =============================================================================
	echo
	exit
fi
echo
echo =============================================================================
echo               your password to access your container is
docker exec $input cat /root/.jenkins/secrets/initialAdminPassword
echo =============================================================================

echo =============================================================================
echo    "For accessing your jenkins portal, Visit -> http://localhost:80$port"
echo =============================================================================
