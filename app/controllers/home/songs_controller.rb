class Home::SongsController < Home::ApplicationController
  def index
    @songs = Song.search(params[:search])
    respond_to do |format|
      format.html
      format.js   { render :file => "home/songs/ajax/search.js.erb" }
      format.json { render :json => @songs.map{ |s| export_hash(s) }.to_json }
    end
  end
end
