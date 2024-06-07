
# Gestor de Campanhas de Desconto

## Descrição
O **Gestor de Campanhas de Desconto** é uma aplicação desenvolvida em Ruby on Rails (RoR) que permite o cadastro de produtos e lojas, além da criação de campanhas de desconto com esses produtos. A aplicação também consome a API da Fake Story para obter dados dos produtos e possui uma API interna que retorna todos os produtos cadastrados no sistema na rota `/api/v1/produtos`.

## Funcionalidades

- **Cadastro de Produtos**: Permite adicionar novos produtos ao sistema.
- **Cadastro de Lojas**: Permite adicionar novas lojas ao sistema.
- **Criação de Campanhas de Desconto**: Permite criar campanhas de desconto envolvendo os produtos cadastrados.
- **Consumo da API Fake Story**: Integração com a API da Fake Story para obter dados de produtos externos.
- **API Interna de Produtos**: Disponibiliza uma rota para acessar todos os produtos cadastrados no sistema.

## Tecnologias Utilizadas

- Ruby on Rails
- Docker
- Docker Compose

## Pré-requisitos

- Docker
- Docker Compose

## Como Executar o Projeto

1. Clone o repositório para o seu ambiente local:
    ```sh
    git clone https://github.com/jvchaves/cresce_cuts_ror_pleno_junho_2024.git
    cd cresce_cuts_ror_pleno_junho_2024
    ```

2. Execute o Docker Compose para iniciar o projeto:
    ```sh
    docker-compose up --build
    ```

3. Acesse a aplicação no seu navegador em `http://localhost:3000`.

## Endpoints da API

### Listar Produtos Cadastrados

- **Rota**: `/api/v1/produtos`
- **Método**: GET
- **Descrição**: Retorna todos os produtos cadastrados no sistema.

## Contato

- Nome: João Victor Chvaes
- Email: joao.victor.chaves159@gmail.com
- GitHub: [jvchaves](https://github.com/jvchaves)
