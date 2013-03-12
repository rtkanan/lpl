require 'test_helper'

class PlayerbondsControllerTest < ActionController::TestCase
  setup do
    @playerbond = playerbonds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playerbonds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playerbond" do
    assert_difference('Playerbond.count') do
      post :create, playerbond: { auction_price: @playerbond.auction_price, grade: @playerbond.grade }
    end

    assert_redirected_to playerbond_path(assigns(:playerbond))
  end

  test "should show playerbond" do
    get :show, id: @playerbond
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playerbond
    assert_response :success
  end

  test "should update playerbond" do
    put :update, id: @playerbond, playerbond: { auction_price: @playerbond.auction_price, grade: @playerbond.grade }
    assert_redirected_to playerbond_path(assigns(:playerbond))
  end

  test "should destroy playerbond" do
    assert_difference('Playerbond.count', -1) do
      delete :destroy, id: @playerbond
    end

    assert_redirected_to playerbonds_path
  end
end
