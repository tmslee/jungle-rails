require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @params = {
        name: "testName",
        email: "test@email.com",
        password: "12345",
        password_confirmation: "12345" 
      }
      test_user = User.new(@params)
      test_user.save

      @new_params = {
        name: "newName",
        email: "new@email.com",
        password: "12345",
        password_confirmation: "12345" 
      }
    end

    it "should save when all fields are present with unique email and matching password" do
      user = User.new(@new_params)
      expect(user.save).to be(true)
    end
    it "should not save when name missing" do
      @new_params[:name] = nil
      user = User.new(@new_params)
      user.save
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it "should not save when email missing" do
      @new_params[:email] = nil
      user = User.new(@new_params)
      user.save
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "should not save when password is missing" do
      @new_params[:password] = nil
      user = User.new(@new_params)
      user.save
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "should not save when password is shorter than required length" do
      @new_params[:password] = "111"
      @new_params[:password_confirmation] = "111" 
      user = User.new(@new_params)
      user.save
      expect(user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
    it "should not save when passwords dont match" do
      @new_params[:password_confirmation] = "11111"
      user = User.new(@new_params)
      user.save
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "should not save when email not unique" do
      @new_params[:email] = "TEST@email.com"
      user = User.new(@new_params)
      user.save
      expect(user.errors.full_messages).to include("Email has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @params = {
        name: "testName",
        email: "test@email.com",
        password: "12345",
        password_confirmation: "12345" 
      }
      test_user = User.new(@params)
      test_user.save
    end

    it "should validate user case insensitive" do
      user = User.authenticate_with_credentials("TEST@email.com", "12345")
      expect(user).to be_a User
    end

    it "should validate user with blank space wrapping on email" do
      user = User.authenticate_with_credentials("        TEST@email.com   ", "12345")
      expect(user).to be_a User
    end

    it "should not validate non existent user email" do
      user = User.authenticate_with_credentials("newMail@email.com", "12345")
      expect(user).to be nil
    end
    
    it "should not validate existing user email with incorrect password" do
      user = User.authenticate_with_credentials("test@email.com", "123455")
      expect(user).to be nil
    end

  end
end
