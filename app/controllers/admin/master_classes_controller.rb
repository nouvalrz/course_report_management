class Admin::MasterClassesController < Admin::ApplicationController
  def index
    @pagy, @master_classes = pagy(MasterClass.order(:id))
  end

  def new
    @master_class = MasterClass.new
    @students = Student.order(:id)
    @teachers = Teacher.order(:id)
  end

  def create
    @master_class = MasterClass.create(master_class_params)
    if @master_class.valid?
      redirect_to admin_master_classes_path, flash: {success: "Class successfully added"}
    else
        @students = Student.order(:id)
        @teachers = Teacher.order(:id)
        flash.now[:error] = @master_class.errors.full_messages.to_sentence
        render :new, status: :unprocessable_entity
    end
  end

  def master_class_params
    params.require(:master_class).permit(:name, :teacher_id, :is_active, student_ids: [])
  end

end
