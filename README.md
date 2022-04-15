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
- Plex (on plex subdomain)

## Prepare
Ensure you have Docker and Docker Compose installed.

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
- zcube/cadvisor: [![GitHub release](https://img.shields.io/github/release/google/cadvisor.svg)](https://hub.docker.com/r/zcube/cadvisor)
- prom/node-exporter: [![GitHub release](https://img.shields.io/github/tag/prometheus/node_exporter.svg)](https://hub.docker.com/r/prom/node-exporter)
- prom/prometheus: [![GitHub release](https://img.shields.io/github/tag/prometheus/prometheus.svg)](https://hub.docker.com/r/prom/prometheus)
- nginx: [![GitHub release](https://img.shields.io/github/tag/nginxinc/docker-nginx.svg)](https://hub.docker.com/_/nginx)
- grafana/grafana: [![GitHub release](https://img.shields.io/github/tag/grafana/grafana.svg)](https://hub.docker.com/r/grafana/grafana)
- linuxserver/plex: [![GitHub release](https://img.shields.io/github/tag/linuxserver/docker-plex.svg)](https://hub.docker.com/r/linuxserver/plex)


## Acknowledgements

- Monitoring stack: https://github.com/oijkn/Docker-Raspberry-PI-Monitoring
- Grafana dashboard: https://grafana.com/grafana/dashboards/15120
