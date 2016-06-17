class Admins::StudyCoursesController < Admins::ApplicationController
  before_action :set_study_course, only: [:show, :edit, :update, :destroy]

  # GET /admins/study_courses
  # GET /admins/study_courses.json
  def index
    @study_courses = StudyCourse.all
  end

  # GET /admins/study_courses/1
  # GET /admins/study_courses/1.json
  def show
  end

  # GET /admins/study_courses/new
  def new
    @study_course = StudyCourse.new
    @study_course.build_attachment
  end

  # GET /admins/study_courses/1/edit
  def edit
    @study_course.build_attachment unless @study_course.attachment
  end

  # POST /admins/study_courses
  # POST /admins/study_courses.json
  def create
    @study_course = StudyCourse.new(study_course_params)
#    @study_course.parent = current_admin_user
    respond_to do |format|
      if @study_course.save
        format.html { redirect_to [:admins, @study_course], notice: 'Study course was successfully created.' }
        format.json { render :show, status: :created, location: @study_course }
      else
        format.html { render :new }
        format.json { render json: @study_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/study_courses/1
  # PATCH/PUT /admins/study_courses/1.json
  def update
    respond_to do |format|
      if @study_course.update(study_course_params)
        format.html { redirect_to [:admins, @study_course], notice: 'Study course was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_course }
      else
        format.html { render :edit }
        format.json { render json: @study_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/study_courses/1
  # DELETE /admins/study_courses/1.json
  def destroy
    @study_course.destroy
    respond_to do |format|
      format.html { redirect_to admins_study_courses_url, notice: 'Study course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_course
      @study_course = StudyCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_course_params
      params.require(:study_course).permit(:parent_type, :parent_id, :name, :summary, :attachment_id, :is_free, :price, :attachment_id, :payment_type_id, :deleted,
      attachment_attributes: [:id, :image, :parent_type, :parent_id, :relation_type, :relation_id])
    end
end
