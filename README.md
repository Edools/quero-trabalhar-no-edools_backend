build: [![CircleCI](https://circleci.com/gh/nathanpsouza/quero-trabalhar-no-edools_backend.svg?style=svg)](https://circleci.com/gh/nathanpsouza/quero-trabalhar-no-edools_backend)

# Teste backend Edools

## Dependências

* Postgresql
* Java (para rodar o solr

## Rodando a aplicação
`$ bundle install`

`$ rake db:create db:migrate`

`$ foreman start`

## Considerações
Antes de executar os testes, é necessário rodar o solr para o ambiente de test com o comando:

`$ rake sunspot:solr:run RAILS_ENV=test`

rode a suíte de testes com:

`$ bundle exec rspec spec`

ps: No estágio atual, o sunspot rodará ou para test ou para development, não sendo possível executar as duas instâncias simultaneamente.