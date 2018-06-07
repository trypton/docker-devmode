# Dev environment with Docker

Docker boilerplate for local development. Provides LAMP (Apache + PHP, MySQL and phpMyAdmin) and Node.js environments.

## How to use

1. Clone repository
2. Copy `.env.sample` file to `.env` and change environment variables
3. Edit docker files if needed
4. Create web server folders and mysql data folders
5. Create ssl folder and generate SSL cert
6. Run `docker-compose build` to build Docker images
7. Copy `docker-compose.yml` file to your project folder and edit as needed
8. Copy necessary values from `.env` file to `.env` file in your project folder
9. Up environment with `docker-compose up -d` or use `devmode.sh` script

## Xdebug

In order to use Xdebug you need to setup XDEBUG_REMOTE_HOST environment variable. You can either set it to your host IP address or setup loopback IP.
