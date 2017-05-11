class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_welcome


  protected

  def send_welcome
    begin
      RegisterMailer.welcome(self.id).deliver_later!
        # Specs raise error for not being able to set default_url_options[:host]
    rescue => ex #Errno::ECONNREFUSED => ex
      Rails.logger.error ex.message
      Rails.logger.error ex.backtrace.join("\n")
      return true # always return true so that failed email doesn't crash app.
    end
  end
end
