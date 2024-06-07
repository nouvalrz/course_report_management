class Admin::StudentsController < ApplicationController
  def index
    @pagy, @students = pagy(Student.all)
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
        @student.master_class_students.create!(student_id: @student.id, master_class_id: student_params[:master_class_id])
      end
      redirect_to admin_students_path, flash: { success: 'Student created successfully' }
    end

    rescue ActiveRecord::RecordInvalid => e
      @master_classes = MasterClass.all
      flash.now[:error] = e.record.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
  end

  def student_params
    params.require(:student).permit(:full_name, :date_of_birth, :master_class_id)
  end
end
