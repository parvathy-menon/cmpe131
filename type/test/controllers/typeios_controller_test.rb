require 'test_helper'

class TypeiosControllerTest < ActionController::TestCase
  setup do
    @typeio = typeios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:typeios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create typeio" do
    assert_difference('Typeio.count') do
      post :create, typeio: { body: @typeio.body}
    end

    assert_redirected_to typeio_path(assigns(:typeio))
  end

  test "should show typeio" do
    get :show, id: @typeio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @typeio
    assert_response :success
  end

  test "should update typeio" do
    patch :update, id: @typeio, typeio: { body: @typeio.body}
    assert_redirected_to typeio_path(assigns(:typeio))
  end

  test "should destroy typeio" do
    assert_difference('Typeio.count', -1) do
      delete :destroy, id: @typeio
    end

    assert_redirected_to typeios_path
  end
end
