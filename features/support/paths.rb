# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    when /^página inicial do MonitoriaCIC$/
      root_path

    when /^página de registro de alunos$/
      new_user_path

    when /^página de registro de professores$/
      new_professor_path
    when /^página de selecao de professores$/
      professors_path
    when /^página de confirmacao dos professores$/
      confirmation_path 

    when /^página de dashboard do usuário$/
      dashboard_path

    when /^página de disciplinas$/
      dashboard_disciplinas_path

    when /^página de monitoria$/
      dashboard_monitorias_path

    when /^página de nova monitoria$/
      new_monitoria_path

    when /^página de importar disciplinas$/
      dashboard_importar_disciplinas_path

    when /^página de informações da disciplina (.*)$/
      disciplina_path(Disciplina.find($1))

    when /^página de monitores da turma$/
      dashboard_monitorias_candidatos_path  
      
    when /^página de alterar monitoria (.*)$/
      edit_monitoria_path(Monitoria.find($1))
      
    when /^página de tarefas do monitor$/
      #tarefas_path(monitoria_id:1)
      tarefas_path
    when /^página de cadastro de tarefas$/
      #tarefas_path(monitoria_id:1)
      new_tarefa_path

    when /^página de avaliação$/
      edit_tarefa_path(Tarefa.find(1))

    when /^página da tarefa$/
      tarefa_path(Tarefa.find(1))
    

    when /^página de edição da disciplina (.*)$/
      edit_disciplina_path(Disciplina.find($1))

    when /^página de nova disciplina$/
      new_disciplina_path

    when /^página de login de usuários$/
      new_session_path

    when /^página de FAQ$/
      faq_path

    when /^página de editar perfil do usuário$/
      dashboard_edit_user_path

    when /^página de dados bancários$/
      dashboard_dados_bancarios_path

    when /^página de histórico$/
      dashboard_historico_path

    when /^página de cadastro de dados bancários$/
      new_dados_bancario_path

    when /^página de edição de dados bancários$/
      edit_dados_bancario_path(User.find_by_email('bernardoc1104@gmail.com').id)

    when /^página de turmas$/
      dashboard_turmas_path

    when /^página de cadastro de turmas$/
      new_turma_path

    when /^página de edição de turma$/
      edit_turma_path(Turma.find(1))

    when /^página de apagar alunos$/
      dashboard_apagar_alunos_path

    when /^página de Sobre do sistema$/
      sobre_path

    when /^página de nova recuperação de senha$/
      new_reset_senha_path

    when /^página de recuperação de senha$/
      reset_senhas_path

    when /^página de importar professores$/
      dashboard_importar_professores_path
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
