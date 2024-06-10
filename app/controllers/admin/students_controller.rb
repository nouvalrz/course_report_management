class Admin::StudentsController < Admin::ApplicationController

  def index
    students = params[:query] ? Student.search(params[:query]).order(:id) : Student.order(:id)
    @pagy, @students = pagy(students)
  end

  def new
    @student = Student.new
    @master_classes = MasterClass.all
  end

  def create
    @student = Student.new(student_params.except(:master_class_id))

    ActiveRecord::Base.transaction do
      @student.save!
      if student_params[:master_class_id].present?
        master_classes = MasterClass.find(student_params[:master_class_id].drop(1))
        @student.master_classes << master_classes
      end
      redirect_to admin_students_path, flash: { success: 'Student created successfully' }
    end

    rescue ActiveRecord::RecordInvalid => e
      @master_classes = MasterClass.all
      flash.now[:error] = e.record.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
  end

  def edit
    begin
      @student = Student.find(params[:id])
      @master_classes = MasterClass.all
    rescue
      redirect_to admin_students_path, flash: {error: "Student not found"}
    end
  end

  def update
    @student = Student.find(params[:id])

    @student.attributes = student_params.except(:master_class_id)
    @student.master_class_ids = student_params[:master_class_id]
    @student.save!

    redirect_to edit_admin_student_path(@student), flash: {success: "Successfully update student!"}

    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound => e
      @master_classes = MasterClass.all
      flash.now[:error] = e.record.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
  end

  def student_params
    params.require(:student).permit(:full_name, :date_of_birth, master_class_id: [])
  end
end
