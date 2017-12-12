require 'test_helper'

class Admin::TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_ticket = admin_tickets(:one)
  end

  test "should get index" do
    get admin_tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_ticket_url
    assert_response :success
  end

  test "should create admin_ticket" do
    assert_difference('Admin::Ticket.count') do
      post admin_tickets_url, params: { admin_ticket: { address: @admin_ticket.address, audio: @admin_ticket.audio, city: @admin_ticket.city, cnpj: @admin_ticket.cnpj, description: @admin_ticket.description, dossier: @admin_ticket.dossier, flow_id: @admin_ticket.flow_id, name: @admin_ticket.name, report: @admin_ticket.report, state: @admin_ticket.state } }
    end

    assert_redirected_to admin_ticket_url(Admin::Ticket.last)
  end

  test "should show admin_ticket" do
    get admin_ticket_url(@admin_ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_ticket_url(@admin_ticket)
    assert_response :success
  end

  test "should update admin_ticket" do
    patch admin_ticket_url(@admin_ticket), params: { admin_ticket: { address: @admin_ticket.address, audio: @admin_ticket.audio, city: @admin_ticket.city, cnpj: @admin_ticket.cnpj, description: @admin_ticket.description, dossier: @admin_ticket.dossier, flow_id: @admin_ticket.flow_id, name: @admin_ticket.name, report: @admin_ticket.report, state: @admin_ticket.state } }
    assert_redirected_to admin_ticket_url(@admin_ticket)
  end

  test "should destroy admin_ticket" do
    assert_difference('Admin::Ticket.count', -1) do
      delete admin_ticket_url(@admin_ticket)
    end

    assert_redirected_to admin_tickets_url
  end
end
