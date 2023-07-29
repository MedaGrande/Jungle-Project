require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "should require a first_name" do
      no_first_name_user = User.new(:first_name => "")
      expect(no_first_name_user).to_not be_valid
    end

    it "should require a last_name" do
      no_last_name_user = User.new(:last_name => "")
      expect(no_last_name_user).to_not be_valid
    end

    it "should require an email" do
      no_email_user = User.new(:email => "")
      expect(no_email_user).to_not be_valid
    end

    it "email should be unique & case insensitive" do
      capital_email = 'JIGNAJEGANU@TEST.COM'
      User.create!(first_name: 'Tom', last_name: 'Bobby', email: 'jignajeganu@test.com', password: '5678')
      user = User.new(:email => capital_email)
      expect(user).to_not be_valid
    end

    it "should not allow password & password_confirmation not matching" do
      user = User.new(first_name: 'Tom', last_name: 'Bobby', email: 'jignajeganu@test.com', password: '1234', password_confirmation: "invalid")
      expect(user).to_not be_valid
    end  
    
    it "should require password & password_confirmation matching" do
      user = User.new(first_name: 'Tom', last_name: 'Bobby', email: 'jignajeganu@test.com', password: '5678', password_confirmation: "5678")
      expect(user).to be_valid
    end  

    it "should not accept short passwords" do
      short = ("a" * 5)
      hash = {:password => short, :password_confirmation => short}
      expect(User.new(hash)).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    
    it "should allow users with the correct email & password to login" do
      user = User.new(first_name: 'Tom', last_name: 'Bobby', email: 'jignajeganu@test.com', password: '5678', password_confirmation: '5678')
      user.save
      saved_user = User.authenticate_with_credentials('jignajeganu@test.com', '5678')
      expected_user = User.find_by_email('jignajeganu@test.com')
     
      expect(saved_user).to eq(expected_user)
    end

  end
end
