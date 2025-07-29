#!/bin/bash
echo "Parando os containers"
docker compose down
echo "Deletando a pasta grafana_data"
sudo rm -rf grafana_data
echo "Deletando a pasta prometheus_data"
sudo rm -rf prometheus_data
echo "Deletando a pasta loki_data"
sudo rm -rf loki_data
