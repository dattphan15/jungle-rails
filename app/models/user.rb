class User < ActiveRecord::Base

  has_secure_password
  
  validates :password, :presence => true,
                      :length => {:within => 6..40}
                      
  validates :password_confirmation, presence: true
  validates :email, :uniqueness => true
  validates :name, presence: true

end
