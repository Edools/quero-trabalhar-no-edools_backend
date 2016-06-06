# Edools - Backend Assignment - Fernando Varani

Excelente desafio, bem elaborado e divertido de fazer. Gostaria de ter tido mais tempo para realizar.
Fiz apenas testes de modelos e das features, que foram necessários para garantir o funcionamento total do app. Mas com mais tempo eu teria feito specs dos controllers.

## 1- Configurando ambiente
$ bundle install

$ rake db:create

$ rake db:migrate

$ rake db:seed (Tem uma prompt de confirmação para limpar o DB)

## 2- Rodando os Specs
$ rspec -f doc

## Code Coverage com Simplecov
Após rodar os testes, será criado um html com um report sobre a cobertura dos testes.
( https://github.com/colszowka/simplecov ) 

## Features

- Gerenciamento de Escolas e Cursos
- Buscar Curso e Escola por Nome e filtrar cursos por escola
- Relatório de Alunos Ativos por escola
- Adicionar validação no atributo Subdomínio da Escola, para que este possa ser usado para criar subdomínios do Edools (Ex: academia-bizstart.edools.com)

*Obrigado pela oportunidade.*
