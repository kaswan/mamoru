class Users::Study::CoursesController < Users::ApplicationController
  before_action :set_course, only: [:show]

  # GET /users/study/courses
  # GET /users/study/courses.json
  def index
    @courses = StudyCourse.all
  end

  # GET /users/study/courses/1
  # GET /users/study/courses/1.json
  def show
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = StudyCourse.find(params[:id])
    end

end
