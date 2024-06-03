#!/bin/bash

dockerHubIsUp() {
  docker pull alpine:3.18 > /dev/null
}

echo "Updates the host packages ..."
sudo apt-get clean -y
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y
echo "Host packages are updated!"

echo "Check if DockerHub can be reached ..."
if ! dockerHubIsUp ; then
	echo "DockerHub canot be reached, will not update images."
else
	echo "Gets update from GitHub ..."
	cd /home/ubuntu/home-media-server-pi
	git pull
	echo "Updates arefetched from GitHub!"

	echo "Fetch missing containers ..."
	cd /home/ubuntu/home-media-server-pi
	docker-compose --env-file .env.pi pull
	echo "Containers are fetched!"

	echo "Starts the containers ..."
	cd /home/ubuntu/home-media-server-pi
	docker-compose --env-file .env.pi up -d --no-recreate
	echo "Containers are started!"

	echo "Cleanup images ..."
	cd /home/ubuntu/home-media-server-pi
	docker system prune -af
	echo "Images are cleared!"
fi

echo "Checking if reboot is required ..."
if [ -f /var/run/reboot-required ]; then
	echo "Rebooting the host!"
	sudo /sbin/reboot
else
	echo "Reboot is not required."
fi
