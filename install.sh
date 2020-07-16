#!/bin/bash

# Script to install required programs to run fa-grafana

echo "Installing required programs to set up fa-grafana..."

# install required packages
requirements=("git pip3 docker docker-compose")

pacman -Syu

for program in $requirements
do
	if [ ! -x "$(command -v $program)" ]; then

		echo "Installing $program..."

		case $program in
		git)
			pacman -S --noconfirm git
		;;
		pip3)
			pacman -S --noconfirm python-pip
		;;
		docker-compose)
			pip3 install docker-compose > /dev/null
		;;
		docker)
			pacman -S --noconfirm docker
		;;
		*)
		;;
		esac
	else
		echo "$program installed. Proceeding..."
	fi
done

echo "All necessary programs installed! Clone the fa-grafana directory and start up docker containers using docker-compose."
