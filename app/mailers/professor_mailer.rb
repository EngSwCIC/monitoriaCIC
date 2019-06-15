class ProfessorMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def key_email
    @professor = params[:professor]
    @url  = 'http://localhost:3000/sessions/new'
    mail(to: @professor.email, subject: 'Saudações querido(a) professor(a)!')
  end
end
