require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'must be created with a password and password_confirmation fields' do
      @user = User.new(
        :name => "Kevin", 
        :email => "kevin@hotmail.com", 
        :password => "123", 
        :password_confirmation => "12" 
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'must be a unique email' do
      @user1 = User.create(
        :name => "Kevin", 
        :email => "kevin@hotmail.com", 
        :password => "123", 
        :password_confirmation => "123" 
      )
      @user2 = User.create(
        :name => "Kevin", 
        :email => "kevin@hotmail.com", 
        :password => "123", 
        :password_confirmation => "123" 
      )
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end


  end
end
