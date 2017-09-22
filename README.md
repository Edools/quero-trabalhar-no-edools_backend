# O desafio

Neste desafio você terá que construir uma gem básica para comunicação com API da Edools. 

Nosso principal objetivo é conhecer como você aborda os problemas e desenvolve soluções.

Você deve subir a gem num repositório público, a entrega será o link do seu novo repositório.

O token da Api Edools enviado por email deve ser utilizado apenas para a criação de uma nova escola.
 
As demais ações da gem devem utilizar o token credentials do admin que vai ser gerado após a criação da escola.

Esse token é retornado no body da request de criação da escola.

Você deve utilizar essa documentaço da nossa API http://docs.edools.com/api/V1
 
O token da Api Edools foi criado para nosso ambiente de staging https://core.myedools.info/

Segue abaixo uma especificação básica. Tudo que não foi especificado deve ser decidido por você, isso também será avaliado.

## Autenticação

- Criar configuração na gem para setar o token da Api Edools

## Escolas

- Criar nova escola utilizando endpoint wizard
- Atualizar escola

## Cursos

- Criar novo curso
- Listar cursos da escola

## Produtos

- Criar novo produto na escola
- Listar produtos da escola

## Alunos

- Enviar convite para aluno matriculando em algum produto
- Listar todos alunos de uma escola
- Listar todos alunos de um produto

## Boas práticas

Não vamos definir quais práticas desejamos. Afinal, queremos conhecer melhor as suas :-).

Siga as boas práticas que adota normalmente nos projetos que desenvolve.

## Restrições Técnicas

- Rails 4 ou 5
- Ruby 2

# Recomendações finais

- Criar testes para o seu código será muito bem visto.
- Você deve subir a gem num repositório com código sob licença MIT.
- O horário do último commit será o horário considerado para a entrega.
- Nossa avaliação não será apenas em cima de produtividade, daremos grande valor a qualidade do código escrito.
- Não iremos considerar entregas após o prazo combinado.

*We wish you good luck, and may the Quality be with you!*
