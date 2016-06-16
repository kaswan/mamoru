class Admins::TutorialsController < Admins::ApplicationController
  before_action :set_tutorial, only: [:show, :edit, :update, :destroy]

  # GET /admins/tutorials
  # GET /admins/tutorials.json
  def index
    @tutorials = Tutorial.all
  end

  # GET /admins/tutorials/1
  # GET /admins/tutorials/1.json
  def show
  end

  # GET /admins/tutorials/new
  def new
    @tutorial = Tutorial.new
  end

  # GET /admins/tutorials/1/edit
  def edit
  end

  # POST /admins/tutorials
  # POST /admins/tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to @admorial, notice: 'Tutorial was successfully created.' }
        format.json { render :show, status: :created, location: @tutorial }
      else
        format.html { render :new }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/tutorials/1
  # PATCH/PUT /admins/tutorials/1.json
  def update
    respond_to do |format|
      if @tutorial.update(tutorial_params)
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutorial }
      else
        format.html { render :edit }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/tutorials/1
  # DELETE /admins/tutorials/1.json
  def destroy
    @tutorial.destroy
    respond_to do |format|
      format.html { redirect_to tutorials_url, notice: 'Tutorial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_params
      params.require(:tutorial).permit(:title, :summary, :is_free)
    end
end
