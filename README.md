# README

# Passos para executar o projeto
O projeto foi gerado com o docker-compose. Portanto basta executar o comando "docker-compose up -d" e tudo será configurado.

# Acessando container
* docker exec -it herospark /bin/bash
* rake db:create
* rake db:migrate
* rake db:seed
* rails s -b 0.0.0.0




* Ruby version -> 2.5.5
* Rails version -> 5.2.3

# Features
* CRUD de Escolas
* CRUD de Cursos
* CRUD de Estudantes
* Criação de cursos a partir do show de Escola
* Relatório de Estudantes Ativos por Escola a partir do show de Escola
* Criação de estudantes a partir do show de Curso
* Ativação e Desativação de estudantes a partir do show de Curso