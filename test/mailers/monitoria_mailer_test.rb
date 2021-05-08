# frozen_string_literal: true


class MonitoriaMailerTest < ActionMailer::TestCase

  def setup
    @monitoria = Monitoria.new
    @monitoria.id = '2'
    @monitoria.remuneracao = 'Voluntária'
    @monitoria.fk_matricula = '140080384'
    @monitoria.fk_cod_disciplina = '1'
    @monitoria.fk_turmas_id = '1'
    @monitoria.descricao_status = 'Nota: SS, IRA: 3'
    @monitoria.prioridade = '1'
    @monitoria.fk_status_monitoria_id = '1'
    
    @disciplina = Disciplina.new(id:113468, nome: "FTC", fk_tipo_disciplina_id: 1, c_prat: 2, c_teor: 2, cod_disciplina: 113468)
    
	@turma = FactoryBot.create(:turma)
	@user = FactoryBot.create(:user)
	@disciplina = FactoryBot.create(:disciplina_email)
	@professor = FactoryBot.create(:professor)
  end
  
  test 'resultado_monitoria_user' do
    email = Monitoria.send_resultado_monitoria_user(@monitoria)
    assert_emails 1 do
      email.deliver_later
    end
    
    assert_equal email.to, [@user.email]
    assert_equal email.from, ['noreply@example.com']
    assert_equal email.subject, 'Resultado do processo da monitoria'
  end
  
  test 'resultado_monitoria_prof' do
    email = Monitoria.send_resultado_monitoria_prof(@monitoria)
    assert_emails 1 do
      email.deliver_later
    end
    
    assert_equal email.to, [@professor.email]
    assert_equal email.from, ['noreply@example.com']
    assert_equal email.subject, 'Resultado do processo da monitoria'
  end
  
end
