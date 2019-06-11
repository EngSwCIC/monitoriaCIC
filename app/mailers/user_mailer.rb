class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_senha.subject
  #
  def reset_senha(user)
    @user = user
    mail to: user.email, subject: "Recuperação de senha"
  end
end
