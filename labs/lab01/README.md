# Laboratório 01

### Objetivo: 

- O objetivo deste laboratório é construir uma infraestrutura para monitoramento, coleta de métricas, logs e alertas, utilizando o Prometheus, Loki, Grafana e Alertmanager.

### Requerimentos:

* docker compose
* docker

Caso não tenha instalado, pode executar o comando abaixo para instalar:

```sh
./dependencies.sh
```

### Sobre as ferramentas deste laboratório:

* **Grafana** - Ferramenta de Dashboard. https://grafana.com
* **Prometheus** - Ferramenta de métricas e monitoramento. https://prometheus.io
* **Alertmanager** - Ferramenta responsável por enviar os alertas para os destinos. https://prometheus.io/docs/alerting/latest/alertmanager/
* **NodeExporter** - É um exporter do prometheus, que coleta as informações do sistema operacional Linux. https://github.com/prometheus/node_exporter
* **Loki** - Ferramenta que armazena os logs. https://grafana.com/loki/
* **Promtail** - Ferramenta que captura os logs e envia para o Loki.
* **cAdvisor** - Ferramenta que captura logs dos containers Docker.

### Iniciando o laboratório:

Dentro da pasta **home** crie uma pasta para o laboratório e a acesse a pasta do laboratório 01.

```sh
mkdir ~/laboratorio-01
cd ~/laboratorio-01/
```

Faça o clone do repositório **learning-siem**.

```sh
git clone git@github.com:salesfilho/learning-siem.git
```

Acesse a pasta que contém os arquivos do laboratório 01.

```sh
cd labs/lab01/
```

Faça uma cópia do arquivo de variáveis, pois o docker compose, só reconhece o .env.

```sh
cp .env-example .env
```

Edite o .env e coloque as variáveis. Escolha o seu editor de texto.

```sh
nano .env
```

Exemplo de saída do arquivo .env.

```sh
ADMIN_PASSWORD = teste
ADMIN_USER = teste
GRAFANA_VERSION = latest
```

Existem algumas dependências para que o laboratório funcione.
É necessário criar os diretórios onde ficarão armazenados os dados do Prometheus, Grafana e Loki.

Execute o script para instalação das dependências.

```sh
./install.sh
```

### Depois da instalação:

Hora de acessar o Grafana.

Digite no navegador, para abrir o grafana.

```sh
https://localhost
```

### Caso queira desinstalar tudo e começar do zero:

Execute o script para desinstalação.

```sh
./uninstall.sh
```

### Caso queira apenas parar o laboratório sem remover os dados:

Execute o comando de parar do docker compose down

```sh
docker compose down
```