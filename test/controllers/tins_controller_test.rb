require 'test_helper'

class TinsControllerTest < ActionController::TestCase
  setup do
    @tin = tins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tin" do
    assert_difference('Tin.count') do
      post :create, tin: { description: @tin.description }
    end

    assert_redirected_to tin_path(assigns(:tin))
  end

  test "should show tin" do
    get :show, id: @tin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tin
    assert_response :success
  end

  test "should update tin" do
    patch :update, id: @tin, tin: { description: @tin.description }
    assert_redirected_to tin_path(assigns(:tin))
  end

  test "should destroy tin" do
    assert_difference('Tin.count', -1) do
      delete :destroy, id: @tin
    end

    assert_redirected_to tins_path
  end
end
