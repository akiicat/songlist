class Dashboard::PlaylistsController < Dashboard::ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/playlists
  # GET /dashboard/playlists.json
  def index
    @playlists = Playlist.all
  end

  # GET /dashboard/playlists/1
  # GET /dashboard/playlists/1.json
  def show
    @songlists = Songlist.where(playlist: @playlist).includes(:prefix, :suffix)
    @songlist  = Songlist.new(playlist: @playlist)
  end

  # GET /dashboard/playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /dashboard/playlists/1/edit
  def edit
  end

  # POST /dashboard/playlists
  # POST /dashboard/playlists.json
  def create
    @playlist = Playlist.new(playlist_params)

    respond_to do |format|
      if @playlist.save
        format.html { redirect_to dashboard_playlists_url, notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/playlists/1
  # PATCH/PUT /dashboard/playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to dashboard_playlists_url, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/playlists/1
  # DELETE /dashboard/playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:video_url, :title, :streamed_at, :published_at)
    end
end
