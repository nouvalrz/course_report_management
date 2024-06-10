class Admin::CourseEnrollmentsController < Admin::ApplicationController
  def index
    @pagy, @master_classes = pagy(MasterClass.active)
  end

  def edit
    @master_class = MasterClass.find(params[:id])
    # @master_class.course_enrollments.build
    @courses = Course.active
  end

  def update
    @master_class = MasterClass.find(params[:id])
    if @master_class.update(course_enrollment_params)
      redirect_to edit_admin_course_enrollment_path(@master_class), flash: {success: "Course enrollment successfully submitted"}
    else
      flash.now[:error] = @master_class.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def course_enrollment_params
    params.require(:master_class).permit(course_enrollments_attributes: [:id, :course_id, :start_date, :end_date, :_destroy])
  end
end
