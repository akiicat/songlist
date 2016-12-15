class Home::SongsController < Home::ApplicationController
  def index
    @songs = Song.search(params[:search]).page(params[:page]).per_page(30)
    respond_to do |format|
      format.html
      format.js   { render :file => "home/songs/ajax/search.js.erb" }
      format.json { render :json => JSON.pretty_generate(@songs.map{ |s| export_hash(s) }) }
    end
  end
end
