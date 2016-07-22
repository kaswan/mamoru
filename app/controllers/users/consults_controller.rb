class Users::ConsultsController < Users::ApplicationController
  before_action :set_specialist, only: [:show, :edit, :update, :destroy, :appointment]

  # GET /users/consults
  # GET /users/consults.json
  def index
    #@specialists = Specialist.joins(:specialist_profile).all.page(params[:page] || 1).per(2)
  end

  # GET /users/consults/1
  # GET /users/consults/1.json
  def show
  end

  # GET /users/consults/new
  def new
    @specialist = Specialist.new
  end

  # GET /users/consults/1/edit
  def edit
  end

  # POST /users/consults
  # POST /users/consults.json
  def create
    @specialist = Specialist.new(specialist_params)

    respond_to do |format|
      if @specialist.save
        format.html { redirect_to @specialist, notice: 'Consult was successfully created.' }
        format.json { render :show, status: :created, location: @specialist }
      else
        format.html { render :new }
        format.json { render json: @specialist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/consults/1
  # PATCH/PUT /users/consults/1.json
  def update
    respond_to do |format|
      if @specialist.update(specialist_params)
        format.html { redirect_to @specialist, notice: 'Consult was successfully updated.' }
        format.json { render :show, status: :ok, location: @specialist }
      else
        format.html { render :edit }
        format.json { render json: @specialist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/consults/1
  # DELETE /users/consults/1.json
  def destroy
    @specialist.destroy
    respond_to do |format|
      format.html { redirect_to specialists_url, notice: 'Consult was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    if params[:specialized_field_id] && !params[:specialized_field_id].blank?
      @specialists = Specialist.joins(:specialist_profile, :specialized_field_relations).where(specialized_field_relations: {specialized_field_id: params[:specialized_field_id]}).all.page(params[:page] || 1).per(2)
    else
      #@specialists = Specialist.joins(:specialist_profile).all.page(params[:page] || 1).per(2)
    end
    render layout: false if request.xhr?
  end
  
  # 予約する
  def appointment
    @schedule_entity = ScheduleEntity.find params[:schedule_entity_id]   
    @conversation = Conversation.new
  end
  
  def appointment_create
    @schedule_entity = ScheduleEntity.find params[:schedule_entity_id]   
    @conversation = Conversation.new(appointment_params)
    
    respond_to do |format|
      if @conversation.save
        @schedule_entity.client = current_user
        @schedule_entity.conversation_id = @conversation.id
        @schedule_entity.editable = false
        @schedule_entity.save
        format.html { redirect_to consults_path, notice: 'Consult was successfully created.' }
        format.json { render :show, status: :created, location: @conversation }
      else
        format.html { render :appointment }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialist
      @specialist = Specialist.find(params[:id])
      @specialized_field = SpecializedField.find(params[:specialized_field_id]) if params[:specialized_field_id]  
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specialist_params
      params.fetch(:specialist, {})
    end
    
    def appointment_params
      params.require(:conversation).permit(:token, :sender_type, :sender_id, :recipient_type, :recipient_id, :specialized_field_id, :remarks, 
                    schedule_entity_attributes: [:client_type, :client_id, :conversation_id, :editable] 
                    )
    end
end
