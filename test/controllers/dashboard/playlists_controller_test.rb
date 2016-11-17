require 'test_helper'

class Dashboard::PlaylistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dashboard_playlist = dashboard_playlists(:one)
  end

  test "should get index" do
    get dashboard_playlists_url
    assert_response :success
  end

  test "should get new" do
    get new_dashboard_playlist_url
    assert_response :success
  end

  test "should create dashboard_playlist" do
    assert_difference('Dashboard::Playlist.count') do
      post dashboard_playlists_url, params: { dashboard_playlist: { title: @dashboard_playlist.title, video_url: @dashboard_playlist.video_url } }
    end

    assert_redirected_to dashboard_playlist_url(Dashboard::Playlist.last)
  end

  test "should show dashboard_playlist" do
    get dashboard_playlist_url(@dashboard_playlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_dashboard_playlist_url(@dashboard_playlist)
    assert_response :success
  end

  test "should update dashboard_playlist" do
    patch dashboard_playlist_url(@dashboard_playlist), params: { dashboard_playlist: { title: @dashboard_playlist.title, video_url: @dashboard_playlist.video_url } }
    assert_redirected_to dashboard_playlist_url(@dashboard_playlist)
  end

  test "should destroy dashboard_playlist" do
    assert_difference('Dashboard::Playlist.count', -1) do
      delete dashboard_playlist_url(@dashboard_playlist)
    end

    assert_redirected_to dashboard_playlists_url
  end
end
