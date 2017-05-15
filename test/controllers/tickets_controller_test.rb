require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get tickets_edit_url
    assert_response :success
  end

  test "should get update" do
    get tickets_update_url
    assert_response :success
  end

end
