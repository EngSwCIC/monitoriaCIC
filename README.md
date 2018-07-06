# MonitoriaCIC

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
  - jQuery-rails
  - RSpec-rails
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
Juntamente com os testes de integração, novas features precisam também de testes
unitários. Para realiza-los, é necessário a utilização do RSpec. Para instala-lo,
o usuário deve executar os comandos:

> $ rails generate rspec:install

Após a instalação, o usuário poderá verificar a criação da pasta 'spec' no diretório principal
da aplicação. Nela, o usuário poderá escrever testes unitários para as _controllers_ e _models_.
O usuário deve criar pastas 'controllers' para os testes das _controllers_ e 'models' para as
_models_. Adicionalmente, poderá criar as pastas 'fixtures' e 'factories' para criar _fixtures_
e _FactoryBots_ a serem utilizados nos testes.

Opicionalmente, o usuário pode abrir o arquivo .rspec, localizado no diretório raiz, e definir
as seguintes diretrizes:

> -c -fd

Que servem para adicionar cor aos resultados gerados e formatação no texto respectivamente.

Por fim, o usuário deve, após a geração dos testes, abrir o arquivo '/coverage/index.html' para
verificar a cobertura do código, aqui realizada pelo SimpleCov.
