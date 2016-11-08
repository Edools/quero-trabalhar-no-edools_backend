# App

## Tecnologias utilizadas

### Backend

- Ruby 2.3.0
- Rails 4
- PostgreSQL 9.6

### Frontend

- Bootstrap 3
- Hapi.js
- Vue.js 2
- jQuery
- Datatables

## Setup backend

Para configurar o projeto, digite o seguinte comando na raíz do projeto:

```bash
$ bundle install
```

Crie os arquivos `.env.development` e `.env.test` na raíz do projeto seguindo o modelo do arquivo `.env`. Nele se encontram os parâmetros necessários para conexão com banco de dados.

Feito isso, execute:

```bash
$ rake db:create
$ rake db:migrate
```

### Testes

Com todas as configurações feitas, pode-se rodar os testes para verificar se a aplicação possui algum erro. Para isso, execute:

```bash
$ rake db:test:prepare
$ rspec
```

## Setup frontend

Os arquivos de visualização por parte do usuário se encontram no diretório `site`. Sendo assim, execute os comandos:

```bash
$ cd ./site
$ npm install
$ bower install
```

Isso fará a instalação dos pacotes necessários para o projeto frontend.

Feito isso, crie um arquivo dentro de `./site` chamando `.env` com o seguinte conteúdo:

```
APP_PORT=4000
API_HOST=http://localhost:3000/rest/v1
```

`APP_PORT` se refere à porta que será utilizada pela aplicação frontend.
`API_HOST` se refere ao link da API.

***Altere os valores se necessário***.
