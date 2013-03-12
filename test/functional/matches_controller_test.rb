require 'test_helper'

class MatchesControllerTest < ActionController::TestCase
  setup do
    @match = matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match" do
    assert_difference('Match.count') do
      post :create, match: { match_date: @match.match_date, mom_id: @match.mom_id, remarks: @match.remarks, status: @match.status, team_one_id: @match.team_one_id, team_two_id: @match.team_two_id, team_won_id: @match.team_won_id, toss_selection: @match.toss_selection, toss_won_id: @match.toss_won_id }
    end

    assert_redirected_to match_path(assigns(:match))
  end

  test "should show match" do
    get :show, id: @match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match
    assert_response :success
  end

  test "should update match" do
    put :update, id: @match, match: { match_date: @match.match_date, mom_id: @match.mom_id, remarks: @match.remarks, status: @match.status, team_one_id: @match.team_one_id, team_two_id: @match.team_two_id, team_won_id: @match.team_won_id, toss_selection: @match.toss_selection, toss_won_id: @match.toss_won_id }
    assert_redirected_to match_path(assigns(:match))
  end

  test "should destroy match" do
    assert_difference('Match.count', -1) do
      delete :destroy, id: @match
    end

    assert_redirected_to matches_path
  end
end
