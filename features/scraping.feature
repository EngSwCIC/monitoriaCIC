# language: pt
Funcionalidade: Como professor, quero identificar se os alunos estão aptos ou não a participar da monitoria.

  Cenário de Fundo:
    Dado que o aluno preencheu o formulario de monitoria, e que neste consta seu histórico

# validarIRA
  Cenário: O aluno aplica para monitoria remunerada com um IRA maior ou igual a 3.5 (Happy Path)
    Quando o IRA que consta em meu historico é maior ou igual a 3.5
    Então a minha aplicação de monitoria tem o IRA válido
  
  Cenário: O aluno aplica para monitoria remunerada com um IRA inferior a 3.5 (Sad Path)
    Quando meu IRA que consta em meu historico é inferior a 3.5
    Então a minha aplicação de monitoria é recusada

# validarMatricula
  Cenário: O aluno aplica para monitoria (remunerada ou voluntária) com uma matrícula válida (Happy Path)
    Quando a matricula extraida do meu historico tem o formato válido
    Então a minha aplicação de monitoria tem a matrícula válida

        
# validarStatusAluno
  Cenário: O aluno aplica para monitoria voluntária ou remunerada com status válido (Happy Path)
    Quando o status que consta no histórico é "ATIVO"
    Então a minha aplicação de monitoria tem o status válido

  Cenário: O aluno aplica para monitoria voluntária ou remunerada com status inválido (Sad Path)
    Quando o status que consta no histórico é diferente de "ATIVO"
    Então a minha aplicação de monitoria é recusada

# validdarMencao
  Cenário: O aluno aplica para monitoria (remunerada ou voluntária) com a mencao igual ou superior a MS (Happy Path)
    Quando a mencao extraida do histórico ou superior a MS
    Então a minha aplicação de monitoria tem a mencao válida

  Cenário: O aluno aplica para a monitoria (remunerada ou voluntaria) com a mencao inferior a MS (Sad Path)
    Quando a mencao extraída do histórico é inferior a MS
    Então a minha aplicação de monitoria é recusada