# Instalação do Wazuh

Para realizar o deploy do Wazuh, é necessário seguir os passos abaixo:

1) Incrementar o valor do max_map_count no seu host (Linux).

```
sudo sysctl -w vm.max_map_count=262144
```

2) Clonar o repositório:

```
git clone https://github.com/wazuh/wazuh-docker.git -b v4.12.0
```

3) Acessar a pasta do single node

```
cd wazuh-docker/single-node
```

4) Rodar a criação dos certificados:

```
docker compose -f generate-indexer-certs.yml run --rm generator
```

5) Edite o arquivo do docker compose nas linhas 22 e 53 onde tem a porta 9200, alterar para 9100. Conforme mostrado abaixo:

```
      - INDEXER_URL=https://wazuh.indexer:9100
```

```
      - "9100:9200"
```

6) Subir o ambiente com docker compose:

```
docker compose up -d
```

O ambiente leva cerca de 1 min para subir tudo. Basta acessar no browser o https://localhost e usar as credenciais

```
Login: admin
Senha: SecretPassword
```

## Para remover

Para remover basta executar os dois comandos abaixo:

```
docker compose down
```

```
docker volume rm $(docker volume ls -q -f name=single-node)
```


# Instalação o Shuffle

Instalar o Shuffle nessa pasta para não misturar com os demais arquivos do projeto.

1) Baixar o repositório e acessar a pasta:

```
git clone https://github.com/Shuffle/Shuffle
```

```
cd Shuffle
```

2) Alterar o arquivo do docker compose nas linhas 55, 56 e 57 para o seguinte:

```
      - SHUFFLE_STATS_DISABLED=false
      - SHUFFLE_LOGS_DISABLED=false
      #- SHUFFLE_SWARM_CONFIG=run
```

3) Colocar as permissões na pasta do shuffle-database:

```
sudo chown 1000:1000 -R shuffle-database
```

4) Realizar o comando do docker compose:

```
docker compose up -d
```

Após a instalação realizar o acesso via browser: http://<seu_ip>:3001 e criar seu login e senha.