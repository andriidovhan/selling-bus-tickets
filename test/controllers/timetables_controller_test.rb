require 'test_helper'

class TimetablesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get timetables_index_url
    assert_response :success
  end

  test "should get show" do
    get timetables_show_url
    assert_response :success
  end

  test "should get new" do
    get timetables_new_url
    assert_response :success
  end

  test "should get create" do
    get timetables_create_url
    assert_response :success
  end

  test "should get edit" do
    get timetables_edit_url
    assert_response :success
  end

  test "should get update" do
    get timetables_update_url
    assert_response :success
  end

  test "should get delete" do
    get timetables_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get timetables_destroy_url
    assert_response :success
  end

end
