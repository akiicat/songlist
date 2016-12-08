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
      format.json { render :json => JSON.pretty_generate(@songs.map{ |s| export_hash(s) }) }
    end
  end

  # GET /dashboard/songs/1
  # GET /dashboard/songs/1.json
  def show
  end

  # GET /dashboard/songs/new
  def new
    @song = Song.new
    @song.build_singer
    @song.build_composer
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
        format.html { redirect_to dashboard_songs_url, notice: "歌曲新增成功。" }
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
        format.html { redirect_to dashboard_songs_url, notice: "歌曲更新成功。" }
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
      format.html { redirect_to dashboard_songs_url, notice: "歌曲刪除成功。" }
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
      args = params.require(:song)
                   .permit(:title, :title_translation, :description, :cover, :feat, :lyric_url, :video_url)
                   .map { |k, v| [k, v.to_s.strip] }
                   .to_h

      singers = {
        "singer_id": :singer_attributes,
        "composer_id": :composer_attributes,
      }
      singers.each do |k, v|
        singer  = params.require(:song).require(v).permit(:id, :name, :name_translation)
        args[k] = Singer.find_singer(singer["name"], singer["name_translation"]).id
      end


      args
    end
end
