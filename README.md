# home-media-server-pi

## What is this about?
Make use of [RaspberyPi](https://www.raspberrypi.com) for home server.

Include setup of:
- Nginx-Proxy (central proxy)
- ACME-Companion (creation/renewal of Let's Encrypt certificates) 
- Dashboard with nginx (on domain root)
- Grafana (on grafana subdomain)
- Prometheus (not exposed, used from Grafana through internal network)
- CAdvisor (not exposed, used from Prometheus through internal network)
- Node-exported (not exposed, used from Prometheus through internal network)
- Wordpress (on blog subdomain)
- MariaDB (not exposed, used from Wordpress through internal network)
- PhpMyAdmin (on myadmin subdomain can connect to MariaDB through internal network)

## Prepare
Ensure you have Docker and Docker Compose installed.

Adjust the .env file contect by setting the base folder, domain, and secrets.
I create a new file named .env.pi and use it instead.

## Start the bundle
```
docker-compose --env-file .env.pi up -d
```
## Stop the bundle
```
docker-compose --env-file .env.pi down
```
