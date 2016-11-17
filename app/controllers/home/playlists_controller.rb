class Home::PlaylistsController < Home::ApplicationController
  def index
    @playlists = Playlist.all
  end
  def show
    @playlist = Playlist.find(params[:id])
  end
end
