require 'test_helper'

class MatchdetailsControllerTest < ActionController::TestCase
  setup do
    @matchdetail = matchdetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matchdetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matchdetail" do
    assert_difference('Matchdetail.count') do
      post :create, matchdetail: { bat_team_id: @matchdetail.bat_team_id, bowl_team_id: @matchdetail.bowl_team_id, extras: @matchdetail.extras, innings: @matchdetail.innings, overs: @matchdetail.overs, score: @matchdetail.score, wickets: @matchdetail.wickets }
    end

    assert_redirected_to matchdetail_path(assigns(:matchdetail))
  end

  test "should show matchdetail" do
    get :show, id: @matchdetail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matchdetail
    assert_response :success
  end

  test "should update matchdetail" do
    put :update, id: @matchdetail, matchdetail: { bat_team_id: @matchdetail.bat_team_id, bowl_team_id: @matchdetail.bowl_team_id, extras: @matchdetail.extras, innings: @matchdetail.innings, overs: @matchdetail.overs, score: @matchdetail.score, wickets: @matchdetail.wickets }
    assert_redirected_to matchdetail_path(assigns(:matchdetail))
  end

  test "should destroy matchdetail" do
    assert_difference('Matchdetail.count', -1) do
      delete :destroy, id: @matchdetail
    end

    assert_redirected_to matchdetails_path
  end
end
