#!/usr/bin/bash

echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo +       Program for Deploying Jenkins Server inside Docker Container        +
echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo
echo Enter the name for your jenkins Server
read input
echo
sleep 4s
echo =============================================================================
echo    Pulling the Image jenkin//jenkins:lts from priyansh9879 Docker Hub Repo
echo =============================================================================
echo
if [ $(docker pull jenkins/jenkins:lts > /dev/null 2>&1; echo $?) = "0" ];
then
	docker pull jenkins/jenkins:lts > /dev/null 2>&1
	echo =============================================================================
	echo                          Downloading Successfull
	echo =============================================================================
elif [ $(docker pull jenkins/jenkins:lts) = '*Status: Image is up to date for jenkins/jenkins:lts*' ];
then
	echo =============================================================================
	echo             Docker Image jenkins/jenkins:lts is already Present
	echo =============================================================================
fi
sleep 4s
echo
echo =============================================================================
echo        Started Building Container with the name $input. Please wait
echo =============================================================================
if [ $(docker run -dit --name $input -p 8080:8080  jenkins/jenkins:lts > /dev/null 2>&1; echo $?) = "0" ];
then
	sleep 120s
	docker run -dit --name $input -p 8080:8080  jenkins/jenkins:lts > /dev/null 2>&1
	echo
	echo =============================================================================
	echo "Container is successfully made with the name $input"
	echo =============================================================================
	echo
elif [ $(docker run -dit --name $input -p 8080:8080  jenkins/jenkins:lts > /dev/null 2>&1; echo $?) = "125" ];
then
	sleep 10s
	echo
	echo =============================================================================
	echo               Container already present with the name $input
	echo =============================================================================
	echo
fi

echo =============================================================================
echo                you password to access your container is
docker exec $input cat /var/jenkins_home/secrets/initialAdminPassword
echo =============================================================================

echo =============================================================================
echo        "For accessing jenkins portal, Visit -> http://localhost:8080"
echo =============================================================================

