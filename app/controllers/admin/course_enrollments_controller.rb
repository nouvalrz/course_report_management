class Admin::CourseEnrollmentsController < Admin::ApplicationController
  def index
    @pagy, @master_classes = pagy(MasterClass.active)
  end

  def edit
    @master_class = MasterClass.find(params[:id])
    # @master_class.course_enrollments.build
    @courses = Course.active
  end
end
