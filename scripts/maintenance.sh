#!/bin/bash
echo "Updates the host packages ..."
sudo apt-get clean -y
sudo apt-get update
sudo apt-get dist-upgrade -y
sudo apt-get upgrade -y
sudo apt-get autoremove -y
echo "Host packages are updated!"

echo "Stops the containers ..."
cd /home/ubuntu/home-media-server-pi
docker-compose --env-file .env.pi down --remove-orphans
echo "Containers are stopped!"

echo "Gets update from GitHub ..."
cd /home/ubuntu/home-media-server-pi
git pull
echo "Updates arefetched from GitHub!"

echo "Starts the containers ..."
cd /home/ubuntu/home-media-server-pi
docker-compose --env-file .env.pi up -d
echo "Containers are started!"

echo "Cleanup images ..."
cd /home/ubuntu/home-media-server-pi
docker system prune -af
echo "Images are cleared!"

echo "Checking if reboot is required ..."
if [ -f /var/run/reboot-required ]; then
	echo "Rebooting the host!"
	sudo /sbin/reboot
else
	echo "Reboot is not required."
fi
