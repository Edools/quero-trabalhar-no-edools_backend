Para abrir o projeto é necessário fazer o clone e rodar os seguintes comandos:

É NECESSÁRIO TER O DOCKER INSTALADO.

1. docker-compose build
2. docker-compose run --rm app bundle install
2. docker-compose run --rm app bundle exec rake db:create db:migrate db:seed
3. docker-compose up