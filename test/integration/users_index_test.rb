require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin     = users(:soroush)
    @non_admin = users(:test2)
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end

  test "index as admin" do
    log_in_as(@admin)
    get users_path
    assert_select 'a', text: 'delete', count: 1
  end
end
