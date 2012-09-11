require 'test_helper'

class HandStatesControllerTest < ActionController::TestCase
  setup do
    @hand_state = hand_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hand_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hand_state" do
    assert_difference('HandState.count') do
      post :create, hand_state: { bits: @hand_state.bits, control: @hand_state.control, counts: @hand_state.counts, email: @hand_state.email, fl: @hand_state.fl, fv: @hand_state.fv, length: @hand_state.length, loser: @hand_state.loser, points: @hand_state.points, together: @hand_state.together, totalcontrol: @hand_state.totalcontrol, totalcounts: @hand_state.totalcounts, totalfl: @hand_state.totalfl, totalfv: @hand_state.totalfv, totalloser: @hand_state.totalloser, totalpots: @hand_state.totalpots }
    end

    assert_redirected_to hand_state_path(assigns(:hand_state))
  end

  test "should show hand_state" do
    get :show, id: @hand_state
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hand_state
    assert_response :success
  end

  test "should update hand_state" do
    put :update, id: @hand_state, hand_state: { bits: @hand_state.bits, control: @hand_state.control, counts: @hand_state.counts, email: @hand_state.email, fl: @hand_state.fl, fv: @hand_state.fv, length: @hand_state.length, loser: @hand_state.loser, points: @hand_state.points, together: @hand_state.together, totalcontrol: @hand_state.totalcontrol, totalcounts: @hand_state.totalcounts, totalfl: @hand_state.totalfl, totalfv: @hand_state.totalfv, totalloser: @hand_state.totalloser, totalpots: @hand_state.totalpots }
    assert_redirected_to hand_state_path(assigns(:hand_state))
  end

  test "should destroy hand_state" do
    assert_difference('HandState.count', -1) do
      delete :destroy, id: @hand_state
    end

    assert_redirected_to hand_states_path
  end
end
