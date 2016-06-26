class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /admins/schedules
  # GET /admins/schedules.json
  def index
    @schedules = current_admin_user.schedules.includes(:schedule_entities)
  end

  # GET /admins/schedules/1
  # GET /admins/schedules/1.json
  def show
  end

  # GET /admins/schedules/new
  def new
    @schedule = Schedule.new
    @schedule.schedule_entities.build
  end

  # GET /admins/schedules/1/edit
  def edit
  end

  # POST /admins/schedules
  # POST /admins/schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to request.referer, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/schedules/1
  # PATCH/PUT /admins/schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to request.referer, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/schedules/1
  # DELETE /admins/schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:start_date, :parent_type, :parent_id, :schedule_type, :title, :public_title,
      schedule_entities_attributes: [:id, :schedule_id, :title, :client_type, :client_id, :date, :start_time, :end_time, :_destroy])
    end
end
