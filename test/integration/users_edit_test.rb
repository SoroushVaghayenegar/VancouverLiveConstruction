require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:soroush)
  end

  test "unsuccessful edit" do
  	post login_path, session: { username: @user.username, password: 'password' }
    assert is_logged_in?
    assert_redirected_to root_path
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name:  "",
                                    username: "asd",
                                    password:              "123",
                                    password_confirmation: "321" }
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "change"
    username = "test_change"
    patch user_path(@user), user: { name:  name,
                                    username: username,
                                    password:              "",
                                    password_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name,  name
    assert_equal @user.username, username
  end
end
