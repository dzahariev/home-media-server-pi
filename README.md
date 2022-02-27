# home-media-server-pi

## What is this about?
Make use of [RaspberyPi](https://www.raspberrypi.com) for home server.

## Prepare
Ensure you have Docker and Docker Compose installed.

Adjust the .env file contect by setting the base folder, domain, and secrets.
I personaly create a new file named .env.pi and use it instead.

## Start the bundle
```
docker-compose --env-file .env.pi up -d
```
## Stop the bundle
```
docker-compose --env-file .env.pi down
```
