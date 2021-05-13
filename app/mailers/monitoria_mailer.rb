class MonitoriaMailer < ApplicationMailer

  before_action {@resultado = params[:resultado]}
  
  ['user', 'prof'].each do |pessoa|
  	define_method("resultado_monitoria_#{pessoa}"){ |pessoa_tipo|
      mail to: pessoa_tipo.email, subject: "Resultado do processo da monitoria"
  	}
  	
  end
    
end
