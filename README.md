build: [![CircleCI](https://circleci.com/gh/nathanpsouza/quero-trabalhar-no-edools_backend.svg?style=svg)](https://circleci.com/gh/nathanpsouza/quero-trabalhar-no-edools_backend)

# instruções

O projeto utiliza o banco de dados postgres e a engine de buscas solr, através da biblioteca sunspot. Para executar o mesmo, é necessário ter o java e postgres instalado na máquina.

Antes de executar os testes, é necessário rodar o solr para o ambiente de test com o comando:
rake sunspot:solr:run RAILS_ENV=test

para subir o servidor o servidor de busca em desenvolvimento, execute:
rake sunspot:solr:run

rode a suite de testes com:
bundle exec rspec spec

ps: No estágio atual, o sunspot rodará ou para test ou para development, não sendo possível executar as duas instâncias simultaneamente.



# O desafio

Neste desafio você terá que construir um sistema básico para manipulação de escolas e cursos. Nosso principal objetivo é conhecer como você aborda os problemas e desenvolve soluções.

Uma especificação básica segue abaixo. Tudo que não foi especificado deve ser decidido por você, isso também será avaliado.

## CRUD de Escolas e Cursos

- Escolas
 - Nome
 - Email do Dono
 - Pitch
 - Subdomínio
 - Data de Criação

- Cursos
 - Título
 - Escola
 - Descrição
 - Conteúdo
 - Duração
 - Data de Criação
 - Alunos Ativos
 - Preço

## Relacionamentos

- Uma escola pode possuir diversos cursos
- Um curso só pode pertencer a uma escola

## Features

- Buscar Curso e Escola por Nome e filtrar cursos por escola
- Relatório de Alunos Ativos por escola
- Adicionar validação no atributo Subdomínio da Escola, para que este possa ser usado para criar subdomínios do Edools (Ex: academia-bizstart.edools.com)

## Boas práticas

Não vamos definir quais práticas desejamos. Afinal, queremos conhecer melhor as suas :-).

Siga as boas práticas que adota normalmente nos projetos que desenvolve.

## Restrições Técnicas

- Rails 4
- Ruby 2

# Recomendações finais

- Nossa avaliação não será apenas em cima de produtividade, daremos grande valor a qualidade do código escrito.
- Não iremos considerar entregas após o prazo combinado.
- O horário do pull-request será o horário considerado para a entrega.

*We wish you good luck, and may the Quality be with you!*
