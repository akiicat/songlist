class Dashboard::SonginfosController < Dashboard::ApplicationController
  before_action :set_songinfo, only: [:show, :edit, :update, :destroy]

  # GET /dashboard/songinfos
  # GET /dashboard/songinfos.json
  def index
    @songinfos = Songinfo.all
  end

  # GET /dashboard/songinfos/1
  # GET /dashboard/songinfos/1.json
  def show
  end

  # GET /dashboard/songinfos/new
  def new
    @songinfo = Songinfo.new
  end

  # GET /dashboard/songinfos/1/edit
  def edit
  end

  # POST /dashboard/songinfos
  # POST /dashboard/songinfos.json
  def create
    @songinfo = Songinfo.new(songinfo_params)

    respond_to do |format|
      if @songinfo.save
        format.html { redirect_to dashboard_songinfos_url, notice: 'Songinfo was successfully created.' }
        format.json { render :show, status: :created, location: @songinfo }
      else
        format.html { render :new }
        format.json { render json: @songinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dashboard/songinfos/1
  # PATCH/PUT /dashboard/songinfos/1.json
  def update
    respond_to do |format|
      if @songinfo.update(songinfo_params)
        format.html { redirect_to dashboard_songinfos_url, notice: 'Songinfo was successfully updated.' }
        format.json { render :show, status: :ok, location: @songinfo }
      else
        format.html { render :edit }
        format.json { render json: @songinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboard/songinfos/1
  # DELETE /dashboard/songinfos/1.json
  def destroy
    @songinfo.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_songinfos_url, notice: 'Songinfo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_songinfo
      @songinfo = Songinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white info through.
    def songinfo_params
      params.require(:songinfo).permit(:content)
    end
end
