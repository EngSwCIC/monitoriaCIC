class MonitoriaMailerPreview < ActionMailer::Preview
  
  def resultado_monitoria_user
    @monitoria = Monitoria.new
    @monitoria.id = '1'
    @monitoria.remuneracao = 'Voluntária'
    @monitoria.fk_matricula = '140080384'
    @monitoria.fk_cod_disciplina = '1'
    @monitoria.fk_turmas_id = '1'
    @monitoria.descricao_status = 'Nota: SS, IRA: 3'
    @monitoria.prioridade = '1'
    @monitoria.fk_status_monitoria_id = '1'
    MonitoriaMailer.resultado_monitoria_user
  end
  
  def resultado_monitoria_prof
    @monitoria = Monitoria.new
    @monitoria.id = '1'
    @monitoria.remuneracao = 'Voluntária'
    @monitoria.fk_matricula = '140080384'
    @monitoria.fk_cod_disciplina = '1'
    @monitoria.fk_turmas_id = '1'
    @monitoria.descricao_status = 'Nota: SS, IRA: 3'
    @monitoria.prioridade = '1'
    @monitoria.fk_status_monitoria_id = '1'
    MonitoriaMailer.resultado_monitoria_prof
  end
  
end
