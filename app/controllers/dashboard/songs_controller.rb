class Dashboard::SongsController < Dashboard::ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/songs
  # GET /dashboard/songs.json
  def index
    #@songs = Song.all.includes(:singer, :composer)
    @songs = Song.search(params[:search])
    respond_to do |format|
      format.html
      format.js   { render :file => "dashboard/songs/ajax/search.js.erb" }
    end
  end

  # GET /dashboard/songs/1
  # GET /dashboard/songs/1.json
  def show
  end

  # GET /dashboard/songs/new
  def new
    @song = Song.new
  end

  # GET /dashboard/songs/1/edit
  def edit
  end

  # POST /dashboard/songs
  # POST /dashboard/songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to dashboard_songs_url, notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/songs/1
  # PATCH/PUT /dashboard/songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to dashboard_songs_url, notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/songs/1
  # DELETE /dashboard/songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.includes(:singer, :composer).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:singer_id, :composer_id, :title, :title_translation, :description, :lyric_url, :video_url)
    end
end
