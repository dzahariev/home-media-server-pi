# home-media-server-pi

## What is this about?
Make use of [RaspberyPi](https://www.raspberrypi.com) for home server.

Include setup of:
- Nginx-Proxy (proxy)
- ACME-Companion (creation/renewal of Let's Encrypt certificates) 
- Dashboard with nginx (on domain root)
- Grafana (on grafana subdomain)
- Prometheus (not exposed, used from Grafana through internal network)
- CAdvisor (not exposed, used from Prometheus through internal network)
- Node-exporter (not exposed, used from Prometheus through internal network)
- Blackbox-exporteer (not exposed, used from Prometheus through internal network)
- Transmission (on transmission subdomain)
- File Browser (on files subdomain)
- Plex (on plex subdomain)
- Calibre (on calibre subdomain)
- FreshRSS (on freshrss subdomain)
- PiHole (on pihole subdomain)
- WireGuard (on vpn subdomain)
- PostgeSQL (not exposed, used through internal network)
- Keycloak (on auth subdomain)
## Prepare
Adjust the .env file content by setting the base folder, domain, and secrets, or create a new file named .env.pi and use it instead.

## Start the bundle
```
docker-compose --env-file .env.pi up -d
```
## Stop the bundle
```
docker-compose --env-file .env.pi down
```

## RPi preparation and maintenance

Details on [preparation](doc/installation.md) and [maintenance](doc/maintenance.md).


## Acknowledgements

- Monitoring stack: https://github.com/oijkn/Docker-Raspberry-PI-Monitoring
- Grafana dashboard: https://grafana.com/grafana/dashboards/15120
