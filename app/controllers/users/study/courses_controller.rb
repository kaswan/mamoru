class Users::Study::CoursesController < Users::ApplicationController
  before_action :set_course, only: [:show]

  # GET /users/study/courses
  # GET /users/study/courses.json
  def index
    @courses = StudyCourse.all.page(params[:page] || 1).per(2)
  end

  # GET /users/study/courses/1
  # GET /users/study/courses/1.json
  def show
  end
  
  def search
    if params[:specialized_field_id] && !params[:specialized_field_id].blank?
      @courses = StudyCourse.where(specialized_field_id: params[:specialized_field_id]).all.page(params[:page] || 1).per(2)
    else
      @courses = StudyCourse.all.page(params[:page] || 1).per(2)
    end
    render layout: false if request.xhr?
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = StudyCourse.find(params[:id])
    end

end
