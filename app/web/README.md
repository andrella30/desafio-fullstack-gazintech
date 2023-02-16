# Frontend - Desafio fullstack Gazin-Tech

## Descrição

<p>Frontend desenvolvido em Flutter Web para a execução dos métodos desenvolvidos no Backend</p>

## Tópicos

<!--ts-->

- [Descrição](#descrição)
- [Features](#features)
- [Pré-requisitos](#pré-requisitos)
- [Executar](#executar)
- [Tecnologias](#tecnologias)
  <!--te-->

## Features
- [x] Listagem de todos os níveis
- [x] Cadastro de nível
- [x] Exclusão de nível
- [x] Edição de nível
- [x] Busca de nível por ID
- [x] Listagem de todos os desenvolvedores
- [x] Busca de desenvolvedor por ID
- [x] Cadastro de desenvolvedor
- [x] Exclusão de desenvolvedor
- [x] Edição de desenvolvedor

## Pré-requisitos

<p>Para rodar o projeto é necessário apenas o Docker</p>

## Executar

<p>Para subir o frontend para o docker é necessário utilizar o seguinte comando </p>

```bash
docker build -t gazin-web .
```

<p> Caso ocorra problemas com cache basta utilizar o seguinte comando </p>

```bash
docker build --no-cache -t gazin-web .
```

<p> Após a imagem ser baixada no dokcer basta utilizar o seguinte comando para acessar a aplicação </p>

```bash
docker run -d -p 1200:80 --name gazin gazin-web
```

<p>A aplicação estará rodando na url  http://localhost:1200/</p>

## Tecnologias

<p>As seguintes ferramentas foram utilizadas na construção do projeto:</p>

- [Flutter](https://flutter.dev/)
- [GetIt](https://pub.dev/packages/get_it)
- [MobX](https://mobx.netlify.app/)
