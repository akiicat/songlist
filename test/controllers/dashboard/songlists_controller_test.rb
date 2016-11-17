require 'test_helper'

class Dashboard::SonglistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dashboard_songlist = dashboard_songlists(:one)
  end

  test "should get index" do
    get dashboard_songlists_url
    assert_response :success
  end

  test "should get new" do
    get new_dashboard_songlist_url
    assert_response :success
  end

  test "should create dashboard_songlist" do
    assert_difference('Dashboard::Songlist.count') do
      post dashboard_songlists_url, params: { dashboard_songlist: { playlist_id: @dashboard_songlist.playlist_id, song_id: @dashboard_songlist.song_id, time: @dashboard_songlist.time } }
    end

    assert_redirected_to dashboard_songlist_url(Dashboard::Songlist.last)
  end

  test "should show dashboard_songlist" do
    get dashboard_songlist_url(@dashboard_songlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_dashboard_songlist_url(@dashboard_songlist)
    assert_response :success
  end

  test "should update dashboard_songlist" do
    patch dashboard_songlist_url(@dashboard_songlist), params: { dashboard_songlist: { playlist_id: @dashboard_songlist.playlist_id, song_id: @dashboard_songlist.song_id, time: @dashboard_songlist.time } }
    assert_redirected_to dashboard_songlist_url(@dashboard_songlist)
  end

  test "should destroy dashboard_songlist" do
    assert_difference('Dashboard::Songlist.count', -1) do
      delete dashboard_songlist_url(@dashboard_songlist)
    end

    assert_redirected_to dashboard_songlists_url
  end
end
