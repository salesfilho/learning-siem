#!/bin/bash
echo "Criando a pasta grafana_data"
sudo mkdir grafana_data
echo "Criando a pasta prometheus_data"
sudo mkdir prometheus_data
echo "Criando a pasta loki_data"
sudo mkdir loki_data
echo "Colocando permissões na pasta inteira"
sudo chmod -R 777 ./grafana_data
sudo chmod -R 777 ./prometheus_data
sudo chmod -R 777 ./loki_data
echo "Iniciando os containers"
docker compose up -d