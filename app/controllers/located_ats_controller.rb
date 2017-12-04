class LocatedAtsController < ApplicationController
  before_action :set_located_at, only: [:show, :edit, :update, :destroy]

  # GET /located_ats
  # GET /located_ats.json
  def index
    @located_ats = LocatedAt.all
  end

  # GET /located_ats/1
  # GET /located_ats/1.json
  def show
  end

  # GET /located_ats/new
  def new
    @located_at = LocatedAt.new
  end

  # GET /located_ats/1/edit
  def edit
  end

  # POST /located_ats
  # POST /located_ats.json
  def create
    @located_at = LocatedAt.new(located_at_params)

    respond_to do |format|
      if @located_at.save
        format.html { redirect_to @located_at, notice: 'Located at was successfully created.' }
        format.json { render :show, status: :created, location: @located_at }
      else
        format.html { render :new }
        format.json { render json: @located_at.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /located_ats/1
  # PATCH/PUT /located_ats/1.json
  def update
    respond_to do |format|
      if @located_at.update(located_at_params)
        format.html { redirect_to @located_at, notice: 'Located at was successfully updated.' }
        format.json { render :show, status: :ok, location: @located_at }
      else
        format.html { render :edit }
        format.json { render json: @located_at.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /located_ats/1
  # DELETE /located_ats/1.json
  def destroy
    @located_at.destroy
    respond_to do |format|
      format.html { redirect_to located_ats_url, notice: 'Located at was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_located_at
      @located_at = LocatedAt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def located_at_params
      params.require(:located_at).permit(:stop_date, :stop_time, :county_fips, :driver_gender, :driver_race, :driver_age, :officer_id, :violation_id)
    end
end
