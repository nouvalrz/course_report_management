class Admin::StudentsController < ApplicationController
  def index
    @pagy, @students = pagy(Student.all)
  end

  def new
    @student = Student.new
    @master_classes = MasterClass.all
  end

  def create
    @student = Student.create(student_params.except(:master_class_id))

    if @student.valid?
      redirect_to admin_students_path, flash: { success: 'Student created successfully' }
    else
      flash.now[:error] = @student.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def student_params
    params.require(:student).permit(:full_name, :date_of_birth, :master_class_id)
  end
end
