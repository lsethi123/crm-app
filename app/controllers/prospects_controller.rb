class ProspectsController < ApplicationController
  before_action :set_prospect, only: [:show, :edit, :update, :destroy, :ajax, :drop]
  before_action :get_stages, only: [:edit, :update, :new]

  # GET /prospects
  # GET /prospects.json
  def index
    @prospects = Prospect.all
    @prospects.each{|prospect|
      stage_id = set_stage(prospect.due_date)
      prospect.update(:stage_id=>stage_id)
    }
    @stages = Stage.all

  end
  def cal
    @prospects = Prospect.all
  end
  def ajax
    ### based on the stage change the due date
    stages = get_stages
    stage_hash = Hash[*stages.collect {|p| [ p.id, p.name ] }.flatten]
    stage_name = stage_hash[params[:stage_id].to_i] 
    if stage_name == "Today"
      due_date = DateTime.now
    elsif stage_name =="Tomorrow"
      due_date = DateTime.now.tomorrow
    elsif stage_name == "SomeTime"
      due_date = DateTime.now.advance(:days=>Random.rand(1..30))
    else
      due_date = DateTime.now.advance(:days=>-(Random.rand(1..30)))
    end
      
    respond_to do |format|
      if @prospect.update(:stage_id => params[:stage_id],:due_date=>due_date)
        format.js { render nothing: true }
      end
    end
  end

  def drop
    # action for convert prospect to client
    client = Customer.new
    client.name = @prospect.name
    client.address = @prospect.address
    client.city = @prospect.city
    client.user_id = current_user.id
    respond_to do |format|
      if client.save
        @prospect.destroy
        format.js { }
      end
    end
  end

  # GET /prospects/1
  # GET /prospects/1.json
  def show
  end

  # GET /prospects/new
  def new
    @prospect = Prospect.new
   # respond_to do |format|
   #   format.js
   # end

  end

  # GET /prospects/1/edit
  def edit
  end

  # POST /prospects
  # POST /prospects.json

  def create
    @prospect = Prospect.new(prospect_params)
    stage_id = set_stage(@prospect.due_date)
    @prospect.stage_id =stage_id
    respond_to do |format|
      if @prospect.save
        format.html { redirect_to prospects_url, notice: 'Prospect was successfully created.' }
        format.json { render :show, status: :created, location: @prospect }
      else
        format.html { render :new }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prospects/1
  # PATCH/PUT /prospects/1.json
  def update
    respond_to do |format|
      if @prospect.update(prospect_params)
        stage_id =set_stage(@prospect.due_date)
        @prospect.stage_id = stage_id
        @prospect.save
        if params[:ajax]=="1"
          format.js { render nothing: true }
        else

          format.html { redirect_to prospects_url, notice: 'Prospect was successfully updated.' }
          format.json { render :show, status: :ok, location: @prospect }
        end
      else
        format.html { render :edit }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prospects/1
  # DELETE /prospects/1.json
  def destroy
    @prospect.destroy
    respond_to do |format|
      format.html { redirect_to prospects_url, notice: 'Prospect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prospect
      @prospect = Prospect.find(params[:id])
    end
    def get_stages
      @stages = Stage.all
    end
    def set_stage(due_date)
      stages = get_stages
      stage_hash = Hash[*stages.collect {|p| [ p.name, p.id ] }.flatten]
      current_date = Date.today.strftime("%Y-%m-%d")
      due_date_str = "#{due_date.to_date}"
      if due_date_str < current_date
        stage = stage_hash['Overdue']
      elsif (current_date == due_date_str )
        stage = stage_hash['Today']
      elsif (due_date_str == Date.tomorrow.strftime("%Y-%m-%d"))
        stage = stage_hash['Tomorrow']
      else
        stage = stage_hash['SomeTime']
      end
        stage
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def prospect_params
      params.require(:prospect).permit(:name, :address,:city,:stage_id,:due_date)
    end
end
