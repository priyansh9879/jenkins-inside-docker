# Jenkins Server Inside Docker Container
This is my first Docker Project in which i have Automated the Process of Deploying Jenkins inside a Docker Container using Shell Script. Here are the steps to use this project:

1. Download the Shell Script in your Base RHel8 System from the link below:
	# https://github.com/priyansh9879/jenkins-inside-docker.git

2. Check the permissions of the Script using:
	# ls -l
it should be -> 
	#[-rwxr-xr-x]

3. Run the script using:
	# ./jenkins.sh

4. Now, it will ask for the name from which you want to build the Container.

5. After that, it starts Building your Container.

6. After completion, you can login to jenkins portal using the details provided by the script.

#Some Basic Docker Vocabulary:

a) For Stoping your Container:
	# docker stop <container_name>

b) For Starting your Container:
	# docker start <container_name>

c) For deleting container, first stop the container and then:
	# docker rm <container_name>
