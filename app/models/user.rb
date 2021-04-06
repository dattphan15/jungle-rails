class User < ActiveRecord::Base

  def self.authenticate_with_credentials(email, password)
    email = email.downcase.strip
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end


  has_secure_password
  validates :password, :presence => true,
                      :length => {:within => 6..40}
                      
  validates :password_confirmation, presence: true
  validates :email, :uniqueness => true
  validates :name, presence: true

end
