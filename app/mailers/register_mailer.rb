
  class RegisterMailer < ActionMailer::Base
    default :from => "http://localhost:3000"
    layout "mailer"

    def welcome(user_id)
      @user = User.find user_id
      mail to: @user.email, subject: 'Registration Confirmation'
    end

  end

