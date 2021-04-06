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
        :password => "123456", 
        :password_confirmation => "123456" 
      )
      @user2 = User.create(
        :name => "Kevin", 
        :email => "kevin@hotmail.com", 
        :password => "123333", 
        :password_confirmation => "123333" 
      )
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end

    it 'must meet the minimum password length' do
      @user = User.new(
        :name => "Kevin", 
        :email => "kevin@hotmail.com", 
        :password => "12345", 
        :password_confirmation => "12345" 
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns an instance of the user' do
      @user1 = User.create(
        :name => "Kevin", 
        :email => "kevin@hotmail.com", 
        :password => "123456", 
        :password_confirmation => "123456" 
      )

      user = User.authenticate_with_credentials('   KEVIN@hotmail.com', '123456')
      expect(user).to be_an_instance_of(User)
    end
  end


end
