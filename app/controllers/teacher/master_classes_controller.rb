class Teacher::MasterClassesController < Teacher::ApplicationController
  def index
    teacher = current_user.teacher
    master_classes = params[:query] ? teacher.master_classes.search(params[:query]).active : teacher.master_classes.active
    @pagy, @master_classes = pagy(master_classes)
  end

  def show
    @master_class = MasterClass.find(params[:id])
  end
end
