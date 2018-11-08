<<<<<<< HEAD
# language: pt
    Funcionalidade: Eu, enquanto professor, quero adicionar uma disciplina de monitoria

        Cenário de Fundo:
            Dado que o banco possui um adminstrador
            Dado que o banco possui um aluno e um professor
            Dado que o banco possui uma disciplina
            Dado que eu estou na página inicial do MonitoriaCIC
            Quando eu clico em "Entrar"
            Então eu devo estar na página de login de usuários
    
        Cenário: O professor adiciona uma disciplina existente(Happy path)
            Dado que o "professor" está logado
            E que o professor é "admin"
            E que está na pagina de disciplinas
            Quando eu clico em "Adicionar nova Disciplina"
            Então eu devo estar na página de nova disciplina
            Quando eu preencho o formulário com:
                | Nome                  | Banco de Dados  |
                | Créditos Práticos     | 2      |
                | Créditos Teóricos     | 2      |
                | Créditos Est          | 2      |
                | Créditos Ext          | 2      |
            E eu escolho o "Optativa" do seletor "Tipo"
            E eu aperto em "Cadastrar"
            Então eu devo estar na página de disciplinas
            E eu devo ver "Disciplina cadastrada com sucesso!"

        Cenário: O professor adiciona uma disciplina sem direitos de admin(Sad path)
            Dado que o "professor" está logado
            E que o professor não é "admin"
            Então eu devo ver "Você não é um professor administrador. Entre em contato com um administrador do sistema."