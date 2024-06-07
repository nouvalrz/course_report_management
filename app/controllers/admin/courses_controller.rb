class Admin::CoursesController < Admin::ApplicationController

  def index
    @pagy, @courses = pagy(Course.all)
  end

end
