require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get group" do
    get :group
    assert_response :success
  end

  test "should get account" do
    get :account
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

end
