class Admin::CoursesController < Admin::ApplicationController

  def index
    @pagy, @courses = pagy(Course.all)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.create!(course_params)

    redirect_to admin_courses_path, flash: { success: 'Course created successfully' }

  rescue ActiveRecord::RecordInvalid => e
      @course = Course.new
      flash.now[:error] = e.record.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
  end

  def course_params
    params.require(:course).permit(:title, :is_active)
  end
end
