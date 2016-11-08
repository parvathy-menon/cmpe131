require 'test_helper'

class BulletinBoardsControllerTest < ActionController::TestCase
  setup do
    @bulletin_board = bulletin_boards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bulletin_boards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bulletin_board" do
    assert_difference('BulletinBoard.count') do
      post :create, bulletin_board: { num_posts: @bulletin_board.num_posts }
    end

    assert_redirected_to bulletin_board_path(assigns(:bulletin_board))
  end

  test "should show bulletin_board" do
    get :show, id: @bulletin_board
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bulletin_board
    assert_response :success
  end

  test "should update bulletin_board" do
    patch :update, id: @bulletin_board, bulletin_board: { num_posts: @bulletin_board.num_posts }
    assert_redirected_to bulletin_board_path(assigns(:bulletin_board))
  end

  test "should destroy bulletin_board" do
    assert_difference('BulletinBoard.count', -1) do
      delete :destroy, id: @bulletin_board
    end

    assert_redirected_to bulletin_boards_path
  end
end
