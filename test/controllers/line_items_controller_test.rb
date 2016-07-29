require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post :create, line_item: { delivered: @line_item.delivered, delivered_time: @line_item.delivered_time, driver_accept_time: @line_item.driver_accept_time, driver_accepted: @line_item.driver_accepted, driver_id: @line_item.driver_id, order_id: @line_item.order_id, pickup: @line_item.pickup, pickup_time: @line_item.pickup_time, service_level: @line_item.service_level, size: @line_item.size }
    end

    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: { delivered: @line_item.delivered, delivered_time: @line_item.delivered_time, driver_accept_time: @line_item.driver_accept_time, driver_accepted: @line_item.driver_accepted, driver_id: @line_item.driver_id, order_id: @line_item.order_id, pickup: @line_item.pickup, pickup_time: @line_item.pickup_time, service_level: @line_item.service_level, size: @line_item.size }
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item
    end

    assert_redirected_to line_items_path
  end
end
