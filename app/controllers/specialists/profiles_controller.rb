class Specialists::ProfilesController < Specialists::ApplicationController
  before_action :set_specialists_profile, only: [:index, :edit, :update, :destroy]

  # GET /specialists/profiles
  # GET /specialists/profiles.json
  def index    
  end
  
  # GET /specialists/profiles/1/edit
  def edit
    @specialist.build_specialist_profile unless @specialist.specialist_profile
    @specialist.specialized_field_relations.build unless @specialist.specialized_field_relations
  end

  # PATCH/PUT /specialists/profiles/1
  # PATCH/PUT /specialists/profiles/1.json
  def update
    respond_to do |format|
      if @specialist.update(specialists_profile_params)
        format.html { redirect_to specialists_profiles_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @specialist }
      else
        format.html { render :edit }
        format.json { render json: @specialist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialists/profiles/1
  # DELETE /specialists/profiles/1.json
  def destroy
    @specialist.destroy
    respond_to do |format|
      format.html { redirect_to specialists_profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialists_profile
      @specialist = current_specialist
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specialists_profile_params
      params.require(:specialist).permit(:name, :email, :gender, :image, 
                     specialist_profile_attributes: [:id, :name, :furigana, :date_of_birth, :postalcode, :prefecture_id, :address, :qualification, :enterprise, :introduction, :home_page_url, :remarks],
                     specialized_field_relations_attributes: [:id, :specialized_field_id, :_destroy]
                    )
    end
end
