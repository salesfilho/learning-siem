# Deploy Wazuh

Para realizar o deploy do Wazuh, é necessário seguir os passos abaixo:

1) Incrementar o valor do max_map_count no seu host (Linux).
```
sudo sysctl -w vm.max_map_count=262144
```
2) Rodar a criação dos certificados:
```
docker compose -f generate-indexer-certs.yml run --rm generator
```
3) Subir o ambiente com docker compose:

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
docker compose up -d
```

```
docker volume rm $(docker volume ls -q -f name=single-node)
```