require 'test_helper'

class Admin::FlowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_flow = admin_flows(:one)
  end

  test "should get index" do
    get admin_flows_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_flow_url
    assert_response :success
  end

  test "should create admin_flow" do
    assert_difference('Admin::Flow.count') do
      post admin_flows_url, params: { admin_flow: { flow_type: @admin_flow.flow_type, role_id: @admin_flow.role_id, stage: @admin_flow.stage } }
    end

    assert_redirected_to admin_flow_url(Admin::Flow.last)
  end

  test "should show admin_flow" do
    get admin_flow_url(@admin_flow)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_flow_url(@admin_flow)
    assert_response :success
  end

  test "should update admin_flow" do
    patch admin_flow_url(@admin_flow), params: { admin_flow: { flow_type: @admin_flow.flow_type, role_id: @admin_flow.role_id, stage: @admin_flow.stage } }
    assert_redirected_to admin_flow_url(@admin_flow)
  end

  test "should destroy admin_flow" do
    assert_difference('Admin::Flow.count', -1) do
      delete admin_flow_url(@admin_flow)
    end

    assert_redirected_to admin_flows_url
  end
end
