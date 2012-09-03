require 'test_helper'

class ElectionsControllerTest < ActionController::TestCase
  setup do
    @election = elections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:elections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create election" do
    assert_difference('Election.count') do
      post :create, election: { ballot_one_count: @election.ballot_one_count, ballot_two_count: @election.ballot_two_count, camp_promotion: @election.camp_promotion, camp_promotion_refused: @election.camp_promotion_refused, district: @election.district, election_refused: @election.election_refused, held_at: @election.held_at, location: @election.location, no_candidates: @election.no_candidates, num_scouts_active: @election.num_scouts_active, num_scouts_eligible: @election.num_scouts_eligible, num_scouts_present: @election.num_scouts_present, unit_number: @election.unit_number, unit_type: @election.unit_type }
    end

    assert_redirected_to election_path(assigns(:election))
  end

  test "should show election" do
    get :show, id: @election
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @election
    assert_response :success
  end

  test "should update election" do
    put :update, id: @election, election: { ballot_one_count: @election.ballot_one_count, ballot_two_count: @election.ballot_two_count, camp_promotion: @election.camp_promotion, camp_promotion_refused: @election.camp_promotion_refused, district: @election.district, election_refused: @election.election_refused, held_at: @election.held_at, location: @election.location, no_candidates: @election.no_candidates, num_scouts_active: @election.num_scouts_active, num_scouts_eligible: @election.num_scouts_eligible, num_scouts_present: @election.num_scouts_present, unit_number: @election.unit_number, unit_type: @election.unit_type }
    assert_redirected_to election_path(assigns(:election))
  end

  test "should destroy election" do
    assert_difference('Election.count', -1) do
      delete :destroy, id: @election
    end

    assert_redirected_to elections_path
  end
end
