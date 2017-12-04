class GivesController < ApplicationController
  before_action :set_gife, only: [:show, :edit, :update, :destroy]

  # GET /gives
  # GET /gives.json
  def index
    @gives = Gife.all
  end

  # GET /gives/1
  # GET /gives/1.json
  def show
  end

  # GET /gives/new
  def new
    @gife = Gife.new
  end

  # GET /gives/1/edit
  def edit
  end

  # POST /gives
  # POST /gives.json
  def create
    @gife = Gife.new(gife_params)

    respond_to do |format|
      if @gife.save
        format.html { redirect_to @gife, notice: 'Gife was successfully created.' }
        format.json { render :show, status: :created, location: @gife }
      else
        format.html { render :new }
        format.json { render json: @gife.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gives/1
  # PATCH/PUT /gives/1.json
  def update
    respond_to do |format|
      if @gife.update(gife_params)
        format.html { redirect_to @gife, notice: 'Gife was successfully updated.' }
        format.json { render :show, status: :ok, location: @gife }
      else
        format.html { render :edit }
        format.json { render json: @gife.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gives/1
  # DELETE /gives/1.json
  def destroy
    @gife.destroy
    respond_to do |format|
      format.html { redirect_to gives_url, notice: 'Gife was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gife
      @gife = Gife.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gife_params
      params.require(:gife).permit(:officer_id, :violation_id)
    end
end
