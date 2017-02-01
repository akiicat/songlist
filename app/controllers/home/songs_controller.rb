class Home::SongsController < Home::ApplicationController
  def index
    @songs = Song.search(params[:search]).page(params[:page]).per_page(50)
    respond_to do |format|
      format.html
      format.js   { render file: "home/songs/ajax/search.js.erb" }
      format.json { render json: JSON.pretty_generate(Song.export) }
    end
  end

  def show
  end
end
