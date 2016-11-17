require 'test_helper'

class Dashboard::SingersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dashboard_singer = dashboard_singers(:one)
  end

  test "should get index" do
    get dashboard_singers_url
    assert_response :success
  end

  test "should get new" do
    get new_dashboard_singer_url
    assert_response :success
  end

  test "should create dashboard_singer" do
    assert_difference('Dashboard::Singer.count') do
      post dashboard_singers_url, params: { dashboard_singer: { name: @dashboard_singer.name, name_translation: @dashboard_singer.name_translation, nametile: @dashboard_singer.nametile } }
    end

    assert_redirected_to dashboard_singer_url(Dashboard::Singer.last)
  end

  test "should show dashboard_singer" do
    get dashboard_singer_url(@dashboard_singer)
    assert_response :success
  end

  test "should get edit" do
    get edit_dashboard_singer_url(@dashboard_singer)
    assert_response :success
  end

  test "should update dashboard_singer" do
    patch dashboard_singer_url(@dashboard_singer), params: { dashboard_singer: { name: @dashboard_singer.name, name_translation: @dashboard_singer.name_translation, nametile: @dashboard_singer.nametile } }
    assert_redirected_to dashboard_singer_url(@dashboard_singer)
  end

  test "should destroy dashboard_singer" do
    assert_difference('Dashboard::Singer.count', -1) do
      delete dashboard_singer_url(@dashboard_singer)
    end

    assert_redirected_to dashboard_singers_url
  end
end
