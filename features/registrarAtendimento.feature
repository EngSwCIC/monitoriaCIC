# language: pt
	Funcionalidade: Monitor pode registrar um atendimento
		O monitor acessa o sistema e é capaz de registrar um atendimento feito por ele.
	
	Cenário de Fundo:
		Dado que eu estou na página x(registro de atendimentos)
		Quando eu clico em "Registrar"
		Então eu devo estar na página de registros de atendimentos

	Cenário: Monitor registra um atendimento (Happy Path)
		Quando o monitor preenche o formulário com:
			  | Aluno atendido  |Cristiane Naves Cardoso       |
        | Dia             |18/11/2019                    |
        | motivo          |dúvida trabalho               |
				| Descricao       |tirou dúvida sobre o trabalho |
		E aperta em "Registrar-se"
		Então o monitor deve estar na página de registro de atendimentos
		E o monitor deve ver "Registro realizado com sucesso!"
	
	Cenário: Monitor não completa o formulário com os campos obrigatórios (Sad Path)
		Quando o monitor preenche o formulário com:
				| Aluno atendido  |Cristiane Naves Cardoso       |
        | Dia             |18/11/2019                    |
        | motivo          |                              |
				| Descricao       |tirou dúvida sobre o trabalho |
		E o monitor aperta em "Registrar-se"
		Então o monitor deve estar na página de registro de atendimentos
		E o monitor deve ver uma mensagem de erro informando "Campo obrigatório 'Motivo' não preenchido!"
