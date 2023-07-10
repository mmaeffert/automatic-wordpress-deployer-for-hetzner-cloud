# Automatic Wordpress deployer for the Hetzner Cloud

This project is a Laravel based webapplication which lets you create and manage Wordpress instances on the [Hetzner Cloud](https://www.hetzner.com/cloud)

## How to install
### For development
- Install the [docker engine](https://docs.docker.com/desktop/install/windows-install/) for your operating system
- Pull the dev branch 
`git init
git remote add origin https://github.com/mmaeffert/automatic-wordpress-deployer-for-hetzner-cloud.git
git fetch --all
git checkout dev
git pull`
- Create and start the image `docker-compose up -d`