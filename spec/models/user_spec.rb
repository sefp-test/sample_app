require 'spec_helper'

describe User do

  before { @user = User.new name: "Example User", email: "user@example.com" }

  subject { @user }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password_digest }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = ' ' }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @user.name = 'a' * 51 }
  	it { should_not be_valid }
  end

  describe "when email format is invalid" do
  	it "should be invalid" do
  		address = %w[with@comma,com without_at.org withou.end@foo. 
  			mail@with_underscope.com with@invalid+symbol.com]
  		address.each do |invalid_address|
  			@user.email = invalid_address
  			expect(@user).not_to be_valid
  		end
  	end
  end

  describe "when user email is valid" do
  	it "should be valid" do
  		addresses = %w[user@foo.COM A_US-ER@f.org a+B@baz.cn]
  		addresses.each do |valid_address|
  			@user.email = valid_address
  			expect(@user).to be_valid
  		end
  	end
  end

  describe "when email address is already taken" do
	  before do
	    user_with_same_email = @user.dup
	    # To make test work with email in any case
	    user_with_same_email.email = @user.email.upcase
	    user_with_same_email.save
	  end
	  # Duplicate is already saved in database.
	  # So user should not be valid.
	  it { should_not be_valid }
	end

end