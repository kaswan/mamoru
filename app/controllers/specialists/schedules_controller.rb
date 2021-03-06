class Specialists::SchedulesController < Specialists::ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /specialists/schedules
  # GET /specialists/schedules.json
  def index
    @schedules = current_specialist.schedules.includes(:schedule_entities)
  end

  # GET /specialists/schedules/1
  # GET /specialists/schedules/1.json
  def show
  end

  # GET /specialists/schedules/new
  def new
    @schedule = Schedule.new
    @schedule.schedule_entities.build
  end

  # GET /specialists/schedules/1/edit
  def edit
    @specialist.build_specialist_profile unless @specialist.specialist_profile
  end

  # POST /specialists/schedules
  # POST /specialists/schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to [:specialists, @schedule], notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: [:specialists, @schedule] }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialists/schedules/1
  # PATCH/PUT /specialists/schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to [:specialists, @schedule], notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: [:specialists, @schedule] }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialists/schedules/1
  # DELETE /specialists/schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to specialists_schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # 予約
  def reservations
    @reservations = current_specialist.get_requests   
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:start_date, :parent_type, :parent_id, :schedule_type, :title, :public_title,
            schedule_entities_attributes: [:id, :schedule_id, :title, :client_type, :client_id, :schedule_date, :start_time, :end_time, :_destroy])
    end
end
