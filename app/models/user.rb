class User < ApplicationRecord

has_secure_password
validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true

def self.authenticate_with_credentials(email, password)
      user = User.find_by_email(email)
    
    if user && user.authenticate(password)
      user
    else
      nil
    end
  
  end

end

