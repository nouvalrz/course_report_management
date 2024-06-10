class Admin::MasterClassesController < Admin::ApplicationController

  def index
    master_classes = params[:query] ? MasterClass.search(params[:query]) : MasterClass.order(:id)
    @pagy, @master_classes = pagy(master_classes)
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

  def edit
    @students = Student.order(:id)
    @teachers = Teacher.order(:id)
    @master_class = MasterClass.find(params[:id])
  end

  def update
    @master_class = MasterClass.find(params[:id])
    @master_class.update(master_class_params)

    if @master_class.valid?
      redirect_to edit_admin_master_class_path(@master_class), flash: {success: "Class successfully updated"}
    else
      @students = Student.order(:id)
      @teachers = Teacher.order(:id)
      flash.now[:error] = @master_class.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def master_class_params
    params.require(:master_class).permit(:name, :teacher_id, :is_active, student_ids: [])
  end

end
