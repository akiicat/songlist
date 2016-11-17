require 'test_helper'

class Dashboard::SongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dashboard_song = dashboard_songs(:one)
  end

  test "should get index" do
    get dashboard_songs_url
    assert_response :success
  end

  test "should get new" do
    get new_dashboard_song_url
    assert_response :success
  end

  test "should create dashboard_song" do
    assert_difference('Dashboard::Song.count') do
      post dashboard_songs_url, params: { dashboard_song: { composer_id: @dashboard_song.composer_id, description: @dashboard_song.description, lyric_url: @dashboard_song.lyric_url, singer_id: @dashboard_song.singer_id, title: @dashboard_song.title, title_translation: @dashboard_song.title_translation, video_url: @dashboard_song.video_url } }
    end

    assert_redirected_to dashboard_song_url(Dashboard::Song.last)
  end

  test "should show dashboard_song" do
    get dashboard_song_url(@dashboard_song)
    assert_response :success
  end

  test "should get edit" do
    get edit_dashboard_song_url(@dashboard_song)
    assert_response :success
  end

  test "should update dashboard_song" do
    patch dashboard_song_url(@dashboard_song), params: { dashboard_song: { composer_id: @dashboard_song.composer_id, description: @dashboard_song.description, lyric_url: @dashboard_song.lyric_url, singer_id: @dashboard_song.singer_id, title: @dashboard_song.title, title_translation: @dashboard_song.title_translation, video_url: @dashboard_song.video_url } }
    assert_redirected_to dashboard_song_url(@dashboard_song)
  end

  test "should destroy dashboard_song" do
    assert_difference('Dashboard::Song.count', -1) do
      delete dashboard_song_url(@dashboard_song)
    end

    assert_redirected_to dashboard_songs_url
  end
end
