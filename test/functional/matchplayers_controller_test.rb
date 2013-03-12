require 'test_helper'

class MatchplayersControllerTest < ActionController::TestCase
  setup do
    @matchplayer = matchplayers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matchplayers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matchplayer" do
    assert_difference('Matchplayer.count') do
      post :create, matchplayer: {  }
    end

    assert_redirected_to matchplayer_path(assigns(:matchplayer))
  end

  test "should show matchplayer" do
    get :show, id: @matchplayer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matchplayer
    assert_response :success
  end

  test "should update matchplayer" do
    put :update, id: @matchplayer, matchplayer: {  }
    assert_redirected_to matchplayer_path(assigns(:matchplayer))
  end

  test "should destroy matchplayer" do
    assert_difference('Matchplayer.count', -1) do
      delete :destroy, id: @matchplayer
    end

    assert_redirected_to matchplayers_path
  end
end
