class Admin::TeachersController < ApplicationController
  def index
    @pagy, @teachers = pagy(Teacher.all)
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.create(teacher_params)

    if @teacher.valid?
      redirect_to admin_teachers_path, flash: { success: 'Teacher created successfully' }
    else
      flash.now[:error] = @teacher.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def teacher_params
    params.require(:teacher).permit(:full_name, user_attributes: [:username, :password, :password_confirmation, :role])
  end
end
