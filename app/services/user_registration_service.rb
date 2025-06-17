class UserRegistrationService
  def self.call(user)
    if user.persisted?
      UserMailer.welcome_email(user).deliver_later
    end
  end
end