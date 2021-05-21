# Sprint 3 - Engenharia de Software
#### Grupo 9
#### UnB - 2020/2

## Grupo

João Pedro Silva de Andrade - 17/0013944  
Pedro Henriques Nogueira - 14/0065032  
Vinícius Caixeta de Souza - 18/0132199  
Gustavo Einstein Soares Oliveira - 17/0104630  
César Augusto Vilela Borges - 16/0116341  

## Projeto

Envio dos emails de resultado de monitoria (professores/alunos monitores).  
Professores recebem um email listando os alunos monitores por turma.  
Alunos recebem um email para cada monitoria confirmada ou rejeitada.  

## Implementações

### Cycromatic

Teste de complexidade de execução do programa no geral.  
Pontuação testada está dentro do mínimo especificado!  

### RubyCritic

Teste do ABC Score de cada método, o que define a complexidade dos métodos em termos de refatoramento.  
Pontuações de complexidade reduzidas para abaixo de 20 pontos com sucesso!  
Complexidade: 0  

### RSpec

Revisita dos testes unitários feitos nas outras sprints com o intuito de rodar a ferramenta de cobertura de testes.  
Relatório gerado indica que nossas classes e métodos foram completamente cobertas!  
- monitoriaCIC/coverage/index.html  
- classe monitoriaCIC/app/mailers/MontitoriaMailer.rb: Cobertura = 100%  
- classe monitoriaCIC/app/models/Monitoria.rb: Cobertura = 100%  

### Cucumber BDD - happy path/sad path

Checagem das orientações do BDD pelo Cucumber - ver se havia um happy e um sad path condizentes.  
Checagem feita com sucesso! Módulos todos passando!  
- monitoriaCIC/features/enviarEmailAluno.feautre  
- monitoriaCIC/features/enviarEmailProfessor.feature  
- monitoriaCIC/features/step_definitions/aluno_email_step.rb  
- monitoriaCIC/features/step_definitions/professor_email_step.rb  

### RDoc

Documentação dinâmica do código através de comentários bem estruturados.  
Métodos gerados pelo nosso grupo documentados com sucesso!  
- monitoriaCIC/doc/Monitoria.html  
- monitoriaCIC/doc/MonitoriaMailer.html  

## Papéis

- Scrum Master - Pedro Nogueira  
- Product Owner - João Pedro  
- Equipe de desenvolvimento - Vinícius, Gustavo, César  

### Modo de trabalho

Trabalho feito em Scrum durante a semana. Não fielmente seguido à risca pelos integrantes não terem o tempo necessário, mas com reuniões esporádicas com definições de funcionalidades.  
Também houve muita programação a par, o que justifica a falta de commits de alguns membros.  

### Funcionalidades

- Vinicius: Encarregado em otimizar a nota do RubyCritic através de refatoramento.  
- Pedro e César: Responsáveis pela documentação em RDoc.  
- João e Gustavo: Encarregados em testar as funcionalidades do Cucumber e do RSpec.  

## Branches

- envio-emails: branch principal desse grupo, feita para enviar todos os emails.  
- emails-professores: branch interna para a funcionalidade de envio dos emails dos professores.  
- emails-alunos: branch interna para a funcionalidade de envio dos emails dos candidatos a monitoria.  
- teste-rspec: branch com os testes rspec.  
- rdoc-grupo9: branch que contém as adições dos comentários do RDoc e as mudanças dos README's.  
- readme-sprint3: branch das últimas atualizações do readme da sprint3.  

## Observações

O teste rspec está na pasta "spec". Para rodar, digite no comando ```rspec spec/models/monitoria_spec.rb```  
