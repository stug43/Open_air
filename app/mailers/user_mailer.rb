# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'open-air@alabintheair.cc'

  def welcome_email(user)
    # on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    # on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue dans la team OpenAir !')
  end

  def bye_email(user)
    @user = user
    mail(to: @user.email, subject: 'A bientôt !')
  end
  end
