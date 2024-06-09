class Admin::CourseEnrollmentsController < Admin::ApplicationController
  def index
    @pagy, @master_classes = pagy(MasterClass.active)
  end
end
