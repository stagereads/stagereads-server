require 'test_helper'

class PeriodicalsControllerTest < ActionController::TestCase
  setup do
    @periodical = periodicals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periodicals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create periodical" do
    assert_difference('Periodical.count') do
      post :create, periodical: {  }
    end

    assert_redirected_to periodical_path(assigns(:periodical))
  end

  test "should show periodical" do
    get :show, id: @periodical
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @periodical
    assert_response :success
  end

  test "should update periodical" do
    put :update, id: @periodical, periodical: {  }
    assert_redirected_to periodical_path(assigns(:periodical))
  end

  test "should destroy periodical" do
    assert_difference('Periodical.count', -1) do
      delete :destroy, id: @periodical
    end

    assert_redirected_to periodicals_path
  end
end
