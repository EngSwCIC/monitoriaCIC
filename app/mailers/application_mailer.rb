class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@example.com' # TODO: mudar esse campo após definir o domínio utilizado pela plataforma
  layout 'mailer'
end
