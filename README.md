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

Solução:

Infelizmente eu acabei me enrolando durante a semana devido a traalho e faculdade e só conegui iniciar os testes hoje às 15 horas, mandei o que eu consegui fazer, sendo que ficou faltando implementar a funcionalidade de incluir alunos nos cursos, que estava pensando em fazer no próprio form de edição/criação de cursos, por meio de 'fields_for' e 'accepts_nested_attributes_for' e ainda faltou as seguintes features:  Buscar Curso e Escola por Nome e filtrar cursos por escola; Relatório de Alunos Ativos por escola; também iria incluir a funcionalidade de completar o subdominio que o user digitasse com o domínio da Edools.

Ainda ficou faltando seguir várias boas práticas, pois repetindo, fiz com pressa, mas sei que isso não pe desculpa.

Enfim, agradeço a oportunidade, espero que tenha chance de mostrar meu trabalho de uma forma mais tranquila no futuro.
