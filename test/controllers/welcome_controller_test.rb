require 'test_helper'
include WelcomeHelper

class WelcomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success

  end

  test "check adding nil files" do
    add_constr(nil, nil, nil, nil, nil, nil, nil, nil)
    assert_response :success
  end

  test "check retrieving from empty db" do
    reset_db
    retrieve_all("In Process")
    retrieve_all("Upcoming Project")
    retrieve_all("Road Closure")
    assert_response :success
  end

  test "check retrieving wrong type " do
    data = retrieve_all("In P")
    assert_response :success
    assert_equal([], data)
  end

end
