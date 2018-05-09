# language: pt
Funcionalidade: Administrador pode adicionar disciplinas

  Cenario: Adicionar uma disciplina
    Dado que eu estou na página inicial da MonitoriaCIC
    Quando eu clicar em "Ver Disciplinas"
    Então eu devo estar na página Disciplinas
    Quando eu preencher os seguintes campos:
      | Nome            | Banco de Dados            |
      | Código          | 10606                     |
      | Professor       | Maristela                 |
      | Departamento    | Cic                       |
    E clicar em "Adicionar"
    Então eu devo estar na página Disciplinas
    E eu devo ver "Disciplina adicionada com sucesso!"