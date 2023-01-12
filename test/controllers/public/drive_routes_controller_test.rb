require "test_helper"

class Public::DriveRoutesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_drive_routes_new_url
    assert_response :success
  end

  test "should get create" do
    get public_drive_routes_create_url
    assert_response :success
  end

  test "should get index" do
    get public_drive_routes_index_url
    assert_response :success
  end

  test "should get show" do
    get public_drive_routes_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_drive_routes_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_drive_routes_update_url
    assert_response :success
  end
end
