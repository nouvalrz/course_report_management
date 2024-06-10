class Admin::CoursesController < Admin::ApplicationController

  def index
    courses = params[:query] ? Course.search(params[:query]).order(:id) : Course.order(:id)
    @pagy, @courses = pagy(courses)
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

  def edit
    begin
      @course = Course.find(params[:id])
    rescue
      redirect_to admin_courses_path, flash: {error: "Course not found"}
    end
  end

  def update
    @course = Course.find(params[:id])

    @course.attributes = course_params
    @course.save!

    redirect_to edit_admin_course_path(@course), flash: {success: "Course updated!"}

    rescue ActiveRecord::RecordInvalid => e
      flash.now[:error] = e.record.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
  end

  def course_params
    params.require(:course).permit(:title, :is_active)
  end
end
