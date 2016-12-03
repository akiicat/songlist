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
      format.json { render :json => @songs.map{ |s| export_hash(s) }.to_json }
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
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      args     = params.require(:song).permit(:title, :title_translation, :description, :lyric_url, :video_url)

      singer   = params.require(:song).require(:singer_attributes).permit(:id, :name, :name_translation)
      composer = params.require(:song).require(:composer_attributes).permit(:id, :name, :name_translation)
      args['singer_id']   = Singer.find_singer(singer['name'], singer['name_translation']).id
      args['composer_id'] = Singer.find_singer(composer['name'], composer['name_translation']).id

      args
    end

    # export
    def export_hash song
      {
        singer: {
          name: song.singer.name.to_s,
          name_translation: song.singer.name_translation.to_s,
        },

        composer: {
          name: song.composer.name.to_s,
          name_translation: song.composer.name_translation.to_s,
        },

        title: song.title.to_s,
        title_translation: song.title_translation.to_s,

        cover: song.cover.to_s,
        feat: song.feat.to_s,

        description: song.description.to_s,

        lyric_url: song.lyric_url.to_s,
        video_url: song.video_url.to_s,
      }
    end
end
