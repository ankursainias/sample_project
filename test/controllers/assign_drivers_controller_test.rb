require 'test_helper'

class AssignDriversControllerTest < ActionController::TestCase
  setup do
    @assign_driver = assign_drivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assign_drivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assign_driver" do
    assert_difference('AssignDriver.count') do
      post :create, assign_driver: { accept: @assign_driver.accept, driver_id: @assign_driver.driver_id, line_item_id: @assign_driver.line_item_id }
    end

    assert_redirected_to assign_driver_path(assigns(:assign_driver))
  end

  test "should show assign_driver" do
    get :show, id: @assign_driver
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @assign_driver
    assert_response :success
  end

  test "should update assign_driver" do
    patch :update, id: @assign_driver, assign_driver: { accept: @assign_driver.accept, driver_id: @assign_driver.driver_id, line_item_id: @assign_driver.line_item_id }
    assert_redirected_to assign_driver_path(assigns(:assign_driver))
  end

  test "should destroy assign_driver" do
    assert_difference('AssignDriver.count', -1) do
      delete :destroy, id: @assign_driver
    end

    assert_redirected_to assign_drivers_path
  end
end
