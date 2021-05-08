Dado('que o aluno foi aceito para essa turma') do
    MonitoriaMailer.resultado_monitoria_user
  end
  
Então('o aluno receberá um email com as informações da turma confirmando a monitoria') do
    MonitoriaMailer.resultado_monitoria_user
end

Dado('que o aluno foi recusado para essa turma') do
    MonitoriaMailer.resultado_monitoria_user
end

Então('o aluno receberá um email com as informações da turma explicando que ele foi recusado para a monitoria') do
    MonitoriaMailer.resultado_monitoria_user
end