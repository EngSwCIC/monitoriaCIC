# README

O MonitoriaCIC é um sistema automatizado de inscrição e seleção de monitores
para as disciplinas do departamento de Ciência da Computação.
A ideia é facilitar a seleção dos monitores e criar um canal mais direto entre
professores, monitores e alunos.

## Requerimentos
A aplicação foi desenvolvida utilizando o framework Rails.
Para instalar o sistema, é necessário possuir:

- Ruby versão 2.4.1
- Rails versão 5.2.0
- Gems:
  - Bootstrap versão 4.1.1
  - Devise versão x.y.z
  - Cucumber-rails
  - Database-cleaner
  - Capybara
  - Launchy
  - HAML
  - Sqlite3

## Instalação
Para instalar a aplicação, é necessário clonar este repositório utilizando o comando:

> $ git clone https://github.com/EngSwCIC/monitoriaCIC

CD para o diretório 'monitoriaCIC', e rode os seguitnes comandos:

> $ bundler install

> $ rake db:migrate

> $ rails server

Feito isso, basta acessar o endereço 'localhost:3000' para acessar a aplicação.

## Testes
### Testes de Integração
Após a inserção de novas features no sistema, é necessário a realização de testes.
Para executá-los, deve-se preparar o ambiente para testes. Execute os seguintes comandos:

> $ bundler install --without production

> $ rails generate cucumber:install

> $ rails generate cucumber\_training\_wheels:install

> $ rake db:test:prepare

Após a execução desses comandos, a pasta "features" irá constar no root da aplicação.
Nela poderão ser criados arquivos ".feature" para rodar testes baseados em "User Stories".

### Testes de Unidade
~ Em desenvolvimento ~
