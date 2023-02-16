# Backend - Desafio fullstack Gazin-Tech

## Descrição

<p>Projeto de uma API REST utilizando o framework Nest e o DB MySQL junto com TypeORM</p>

## Tópicos

<!--ts-->

- [Descrição](#descrição)
- [Features](#features)
- [Pré-requisitos](#pré-requisitos)
- [Executar](#executar)
- [Endpoints](#endpoints)
- [Tecnologias utilizadas](#tecnologias)
<!--te-->

## Features

- [x] Listagem de todos os níveis
- [x] Busca de nível por ID
- [x] Cadastro de nível
- [x] Exclusão de nível
- [x] Impedir que um nível seja removido quando houver um (ou mais) desenvolvedor(es) associado a este
- [x] Edição de nível
- [x] Listagem de todos os desenvolvedores
- [x] Busca de desenvolvedor por ID
- [x] Cadastro de desenvolvedor
- [x] Exclusão de desenvolvedor
- [x] Edição de dado do desenvolvedor

## Pré-requisitos

<p>Para rodar o projeto são necessárias as tecnologias Nodejs e Docker</p>

## Executar

<p>Para subir o banco e a API basta rodar o comando:</p>

```bash
docker-compose up -d
```

<p>Após subir os containers a API ficará alocada na porta 3030 (acesso por: http://localhost:3333) e o banco ficará alocado na porta 5432 </p>

<p>Caso deseje parar a execução do container, utilize:</p>

```bash
docker-compose down
```

## Endpoints

### Níveis

<p> POST:  Para chamar o post basta acessar:   http://localhost:3333/niveis e passar um corpo no formato abaixo:<p>  
  
 ```json
{
  "nivel": "Pleno A"
}
``` 
Não é permitida a criação de dois níveis iguais.

<p> GET: Para chamar o GET basta acessar:   http://localhost:3333/niveis. Caso queira realizar a busca de um nível específico, basta passar o id:<p>

-  http://localhost:3333/niveis/1 (Retorna nivel com o id igual a 1)

<p> PUT: Para chamar o PUT basta acessar:   http://localhost:3333/niveis/{id do nivel}. Você pode modificar alguma informação do JSON abaixo<p>

```json
{
  "nivel": "Pleno A"
}
```

Não é permitida a edição de um nível caso já exista outro nível com aquele valor.

<p> DELETE: Para chamar o DELETE basta acessar:   http://localhost:3333/niveis/{id do nivel}.<p>
Não é permitida a exclusão de um nível caso esteja associado à um ou mais desenvolvedores.

### Desenvolvedores

<p> POST:  Para chamar o post basta acessar:   http://localhost:3333/desenvolvedores e passar um corpo no formato abaixo:<p>  
  
 ```json
{
  "nome": "Gabriel",
  "idade": 23,
  "hobby": "Correr",
  "sexo": "M",
  "dataNascimento": "1999-09-30",
  "nivelId": 1
}
``` 
<p> GET: Para chamar o GET basta acessar:   http://localhost:3333/desenvolvedores. <p>
<p> GET: Para retornar o desenvolvedor com o id especifico:   http://localhost:3333/desenvolvedores/1. <p>

<p> PUT: Para chamar o PUT basta acessar:  http://localhost:3333/desenvolvedores/{id do desenvolvedor}. Você pode modificar alguma informação do JSON abaixo<p>

```json
{
  "nome": "Gabriel",
  "idade": 23,
  "hobby": "Correr",
  "sexo": "M",
  "dataNascimento": "1999-09-30",
  "nivelId": 1
}
```

<p> DELETE: Para chamar o DELETE basta acessar:  http://localhost:3333/desenvolvedores/{id do desenvolvedor}.<p>

## Tecnologias

<p>As seguintes ferramentas foram utilizadas na construção do projeto:</p>

- [Node.js](https://nodejs.org/en/)
- [Express](https://expressjs.com/pt-br/)
- [Postgres](https://www.postgresql.org/)
- [Docker](https://www.docker.com/products/docker-desktop)
- [TypeORM](https://typeorm.io/)
