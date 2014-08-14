class StagesController < ApplicationController
  before_action :set_stage, only: [:show, :edit, :update, :destroy]

  def new
    @stage = Stage.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @stage = Stage.new(stage_params)

    respond_to do |format|
      if @stage.save
        format.html { redirect_to prospects_url, notice: 'Stage was successfully created.' }
        format.json { render :show, status: :created, location: @stage }
      else
        format.html { render :new }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stage.update(stage_params)
        format.html { redirect_to  prospects_url, notice: 'Stage was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @stage.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @stage.destroy
    respond_to do |format|
      format.html { redirect_to prospects_url, notice: 'Stage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index
    @stages = Stage.all
  end

  def show

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stage
      @stage = Stage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stage_params
      params.require(:stage).permit(:name)
    end
end
