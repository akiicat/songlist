class Dashboard::SonglistsController < Dashboard::ApplicationController
  before_action :set_songlist, only: [:show, :edit, :update, :destroy]
  before_action :set_songlists, only: [:update, :destroy]

  # GET /dashboard/songlists
  # GET /dashboard/songlists.json
  def index
    @songlists = Songlist.all
  end

  # GET /dashboard/songlists/1
  # GET /dashboard/songlists/1.json
  def show
  end

  # GET /dashboard/songlists/new
  def new
    @songlist = Songlist.new
  end

  # GET /dashboard/songlists/1/edit
  def edit
    respond_to do |format|
      format.html { render :edit }
      format.js   { render :file => "dashboard/songlists/ajax/_edit.js.erb" }
    end
  end

  # POST /dashboard/songlists
  # POST /dashboard/songlists.json
  def create
    @songlist = Songlist.new(songlist_params)
    set_songlists
    respond_to do |format|
      if @songlist.save
        format.html { redirect_to dashboard_songlists_url, notice: 'Songlist was successfully created.' }
        format.json { render :show, status: :created, location: @songlist }
        format.js   { render :file => "dashboard/songlists/ajax/_success.js.erb" }
      else
        format.html { render :new }
        format.json { render json: @songlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/songlists/1
  # PATCH/PUT /dashboard/songlists/1.json
  def update
    respond_to do |format|
      if @songlist.update(songlist_params)
        format.html { redirect_to dashboard_songlists_url, notice: 'Songlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @songlist }
        format.js   { render :file => "dashboard/songlists/ajax/_success.js.erb" }
      else
        format.html { render :edit }
        format.json { render json: @songlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/songlists/1
  # DELETE /dashboard/songlists/1.json
  def destroy
    @songlist.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_songlists_url, notice: 'Songlist was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :file => "dashboard/songlists/ajax/_success.js.erb" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_songlist
      @songlist = Songlist.find(params[:id])
    end

    def set_songlists
      @songlists = Songlist.where_all_element(playlist: @songlist.playlist) if @songlist.playlist
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def songlist_params
      params.require(:songlist).permit(:playlist_id, :song_id, :prefix_id, :suffix_id, :marker)
    end
end
