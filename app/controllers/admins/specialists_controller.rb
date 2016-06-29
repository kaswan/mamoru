class Admins::SpecialistsController < Admins::ApplicationController
  before_action :set_specialist, only: [:show, :edit, :update, :destroy]

  # GET /admins/specialists
  # GET /admins/specialists.json
  def index
    @specialists = Specialist.all
  end

  # GET /admins/specialists/1
  # GET /admins/specialists/1.json
  def show
  end

  # GET /admins/specialists/new
  def new
    @specialist = Specialist.new
    @specialist.build_specialist_profile
  end

  # GET /admins/specialists/1/edit
  def edit
    @specialist.build_specialist_profile unless @specialist.specialist_profile
  end

  # POST /admins/specialists
  # POST /admins/specialists.json
  def create
    @specialist = Specialist.new(specialist_params)

    respond_to do |format|
      if @specialist.save
        format.html { redirect_to [:admins, @specialist], notice: 'Specialist was successfully created.' }
        format.json { render :show, status: :created, location: [:admins, @specialist] }
      else
        format.html { render :new }
        format.json { render json: @specialist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/specialists/1
  # PATCH/PUT /admins/specialists/1.json
  def update
    respond_to do |format|
      if @specialist.update(specialist_params)
        format.html { redirect_to [:admins, @specialist], notice: 'Specialist was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admins, @specialist] }
      else
        format.html { render :edit }
        format.json { render json: @specialist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/specialists/1
  # DELETE /admins/specialists/1.json
  def destroy
    @specialist.destroy
    respond_to do |format|
      format.html { redirect_to admins_specialists_url, notice: 'Specialist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialist
      @specialist = Specialist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specialist_params
      params.require(:specialist).permit(:name, :email, :gender, :image, :password,
                      specialist_profile_attributes: [:id, :name, :furigana, :date_of_birth, :postalcode, :prefecture_id, :address, :qualification, :specialized_field, :introduction, :home_page_url, :remarks],
                      specialized_field_relations_attributes: [:id, :specialized_field_id]
                     )
    end
end
