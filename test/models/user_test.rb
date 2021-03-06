require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(name: "Soroush" , username: "test",
  					 password: "123", password_confirmation: "123")
  end

  test "Should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do 
  	@user.name = "    "
  	assert_not @user.valid?
  end

  test "username should be present" do 
  	@user.username = "    "
  	assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "Username should be unique" do 
  	duplicate_user = @user.dup
  	duplicate_user.username = @user.username.upcase 
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 2
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end
end
