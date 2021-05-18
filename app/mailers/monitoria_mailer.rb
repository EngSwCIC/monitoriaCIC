##
# MonitoriaMailer
#
# Classe de acesso das monitorias ao serviço de email usado.
#
# Herda de ApplicationMailer, que é o acesso geral ao serviço de email do programa.
#
# @param [Int] resultado Número extraído do banco de dados que estabelece se aluno foi aceito na monitoria.
#
class MonitoriaMailer < ApplicationMailer

  before_action {
    @resultado = params[:resultado]
  }

  ['user', 'prof'].each do |pessoa|
    define_method("resultado_monitoria_#{pessoa}") { |pessoa_tipo|
      mail to: pessoa_tipo.email, subject: "Resultado do processo da monitoria"
    }
  end

end
