class Users::ProfilesController < Users::ApplicationController
  before_action :set_users_profile, only: [:index, :edit, :update]

  # GET /users/profiles
  # GET /users/profiles.json
  def index
  end

#  # GET /users/profiles/1
#  # GET /users/profiles/1.json
#  def show
#  end

#  # GET /users/profiles/new
#  def new
#    @user = Users::Profile.new
#  end

  # GET /users/profiles/1/edit
  def edit
    @user.build_user_profile unless @user.user_profile
  end

#  # POST /users/profiles
#  # POST /users/profiles.json
#  def create
#    @user = Users::Profile.new(users_profile_params)
#
#    respond_to do |format|
#      if @user.save
#        format.html { redirect_to @user, notice: 'Profile was successfully created.' }
#        format.json { render :show, status: :created, location: @user }
#      else
#        format.html { render :new }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # PATCH/PUT /users/profiles/1
  # PATCH/PUT /users/profiles/1.json
  def update
    respond_to do |format|
      if @user.update(users_profile_params)
        format.html { redirect_to profiles_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/profiles/1
  # DELETE /users/profiles/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_profile
      @user = User.find(current_user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_profile_params
      params.require(:user).permit(:name, :email, :gender, :image, 
              user_profile_attributes: [:id, :name, :furigana, :date_of_birth, :postalcode, :prefecture_id, :address, :occupation, :interest, :remarks] 
              )
    end
end
