require "test_helper"

class Public::DriveReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_drive_reports_new_url
    assert_response :success
  end

  test "should get create" do
    get public_drive_reports_create_url
    assert_response :success
  end

  test "should get edit" do
    get public_drive_reports_edit_url
    assert_response :success
  end

  test "should get update" do
    get public_drive_reports_update_url
    assert_response :success
  end

  test "should get index" do
    get public_drive_reports_index_url
    assert_response :success
  end

  test "should get show" do
    get public_drive_reports_show_url
    assert_response :success
  end
end
