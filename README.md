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
- MeTube (on metube subdomain)
- FreshRSS (on freshrss subdomain)
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

## Links

- nginxproxy/nginx-proxy: [![GitHub release](https://img.shields.io/github/tag/nginx-proxy/nginx-proxy.svg)](https://hub.docker.com/r/nginxproxy/nginx-proxy) 
- nginxproxy/acme-companion: [![GitHub release](https://img.shields.io/github/tag/nginx-proxy/acme-companion.svg)](https://hub.docker.com/r/nginxproxy/acme-companion)
- gcr.io/cadvisor/cadvisor: [![GitHub release](https://img.shields.io/github/release/google/cadvisor.svg)](https://console.cloud.google.com/gcr/images/cadvisor/GLOBAL/cadvisor)
- prom/node-exporter: [![GitHub release](https://img.shields.io/github/tag/prometheus/node_exporter.svg)](https://hub.docker.com/r/prom/node-exporter)
- prom/blackbox-exporter: [![GitHub release](https://img.shields.io/github/v/tag/prometheus/blackbox_exporter.svg)](https://hub.docker.com/r/prom/blackbox-exporter)
- prom/prometheus: [![GitHub release](https://img.shields.io/github/tag/prometheus/prometheus.svg)](https://hub.docker.com/r/prom/prometheus)
- nginx: [![GitHub release](https://img.shields.io/github/tag/nginxinc/docker-nginx.svg)](https://hub.docker.com/_/nginx)
- grafana/grafana: [![GitHub release](https://img.shields.io/github/tag/grafana/grafana.svg)](https://hub.docker.com/r/grafana/grafana)
- linuxserver/transmission: [![GitHub release](https://img.shields.io/github/tag/linuxserver/docker-transmission.svg)](https://hub.docker.com/r/linuxserver/transmission)
- filebrowser/filebrowser: [![GitHub release](https://img.shields.io/github/tag/filebrowser/filebrowser.svg)](https://hub.docker.com/r/filebrowser/filebrowser)
- linuxserver/plex: [![GitHub release](https://img.shields.io/github/tag/linuxserver/docker-plex.svg)](https://hub.docker.com/r/linuxserver/plex)
- linuxserver/calibre: [![GitHub release](https://img.shields.io/github/tag/linuxserver/docker-calibre.svg)](https://hub.docker.com/r/linuxserver/calibre)
- alexta69/metube: [![GitHub release](https://img.shields.io/github/tag/alexta69/metube.svg)](https://hub.docker.com/r/alexta69/metube)
- linuxserver/freshrss: [![GitHub release](https://img.shields.io/github/tag/linuxserver/docker-freshrss.svg)](https://hub.docker.com/r/linuxserver/freshrss)
- postgres: [![GitHub release](https://img.shields.io/github/tag/postgres/postgres.svg)](https://hub.docker.com/_/postgres)
- keycloak/keycloak: [![GitHub release](https://img.shields.io/github/tag/keycloak/keycloak.svg)](https://hub.docker.com/r/keycloak/keycloak)

## RPi preparation and maintenance

Details on [preparation](doc/installation.md) and [maintenance](doc/maintenance.md).


## Acknowledgements

- Monitoring stack: https://github.com/oijkn/Docker-Raspberry-PI-Monitoring
- Grafana dashboard: https://grafana.com/grafana/dashboards/15120
