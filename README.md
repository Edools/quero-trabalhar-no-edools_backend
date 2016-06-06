# Desafio Edools
 O App é uma sistema básico para manipulação de escolas, cursos e alunos desenvolvido com Ruby on Rails 
 para desafio de programação Edools.
 
 O app se encontra no Heroku para teste.
 
 Link: https://ancient-hollows-97706.herokuapp.com/
 

 ### Features
 
 * Listar Escolas, Cursos e Alunos
 * Cadastrar Escolas, Cursos e Alunos
 * Sistema de Matrícula, vinculando aluno a um curso
 * Relatório de alunos por escola
 * Buscar alunos por curso
 * Buscar cursos por escola

 
 ### Ferramentas usadas
 
 * Rails 4
 * Sass
 * PostgreSQL
 * Responders
 * JQuery
 * Rspec
 * Puma
 * Foreman
  

 # Desenvolvimento
 
 ### Configurações Iniciais
 
 
 ```
 $ bundle install
 ```
 
 ```
 $ rake db:create && rake db:migrate
 ```
 
 Rodar o Server:
 
 ```
 $ foreman start
 ```
