# Jenkins Server Inside Docker Container

This is my first Docker Project in which i have Automated the Process of Deploying Jenkins inside a Docker Container using Shell Script. For now, this script is made specially for deploying jenkins server inside centos version 7 Docker Image Running on Red Hat Enterprise Linux Version 8.

You can Pull the Jenkins Image Manually from my Docker Hub Repository.

# docker pull priyansh9879/centos-jenkins:7

For running the image, you can simply use:

# docker run -dit --name jenkins --privileged -expose -p 8081:8080 -v /:/host priyansh9879/centos-jenkins:7

Note: In place of jenkins, you can use any name for your container and in place of 8081, you can use any port number. Don't use Port [8080] as it will raise some conflicts in you Rhel8 VM.

You can access your Jenkins Server from:

# http://localhost:8081

Note: In place of localhost, you can also use your ontainer IP address and use the port that you have used while running Jenkins Container.

# How to use Automated Script for building Jenkins Server:

1. Download the Shell Script in your Base Rhel8 System from the link below:
	
	# https://github.com/priyansh9879/jenkins-inside-docker.git

2. Check the permissions of the Script using:
	
	# ls -l
   
   It should be:
	
	# -rwxr-xr-x

3. Run the script using:
	
	# ./jenkins.sh

4. Now, it will ask for the name and Port Number from which you want to build the Container.

5. After that, it starts Building your Container.

6. After completion, you can login to jenkins portal using the details provided by the script.

# Some Basic Docker Vocabulary:

a) For Stoping your Container:
	
	# docker stop <container_name>

b) For Starting your Container:
	
	# docker start <container_name>

c) For deleting container, first stop the container and then:
	
	# docker rm <container_name>

d) For going inside jenkins container:
	
	# docker exec -it <container_name> /bin/bash
