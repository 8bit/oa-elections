require 'test_helper'

class CandidatesControllerTest < ActionController::TestCase
  setup do
    @candidate = candidates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:candidates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create candidate" do
    assert_difference('Candidate.count') do
      post :create, candidate: { bsa_id: @candidate.bsa_id, dob: @candidate.dob, elected: @candidate.elected, election_id: @candidate.election_id, email_parent: @candidate.email_parent, email_scout: @candidate.email_scout, first_name: @candidate.first_name, last_name: @candidate.last_name, middle_name: @candidate.middle_name, nick_name: @candidate.nick_name, ordeal_date: @candidate.ordeal_date, phone_home: @candidate.phone_home, phone_mobile: @candidate.phone_mobile, rank: @candidate.rank }
    end

    assert_redirected_to election_candidate_path(@election, assigns(:candidate))
  end

  test "should show candidate" do
    get :show, id: @candidate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @candidate
    assert_response :success
  end

  test "should update candidate" do
    put :update, id: @candidate, candidate: { bsa_id: @candidate.bsa_id, dob: @candidate.dob, elected: @candidate.elected, election_id: @candidate.election_id, email_parent: @candidate.email_parent, email_scout: @candidate.email_scout, first_name: @candidate.first_name, last_name: @candidate.last_name, middle_name: @candidate.middle_name, nick_name: @candidate.nick_name, ordeal_date: @candidate.ordeal_date, phone_home: @candidate.phone_home, phone_mobile: @candidate.phone_mobile, rank: @candidate.rank }
    assert_redirected_to election_candidate_path(@election, assigns(:candidate))
  end

  test "should destroy candidate" do
    assert_difference('Candidate.count', -1) do
      delete :destroy, id: @candidate
    end

    assert_redirected_to candidates_path
  end
end
