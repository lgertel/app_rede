class RentMailer < ApplicationMailer
  default from: 'atendimento@rede.com.br'

  def close_ticket_mail(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: 'lgertel@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
