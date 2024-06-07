class Admin::TeachersController < Admin::ApplicationController

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

  def edit
    begin
      @teacher = Teacher.find(params[:id])
    rescue
      redirect_to admin_teachers_path, flash: {error: "Teacher not found"}
    end
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher_params = teacher_params

    @teacher.assign_attributes(@teacher_params)

    if @teacher.changed? || @teacher.user.changed?
      if @teacher.save
        redirect_to edit_admin_teacher_path(@teacher), flash: {success: "Successfully update teacher!"}
      else
        flash.now[:error] = @teacher.errors.full_messages.to_sentence
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:error] = "Data not changed"
      render :edit, status: :unprocessable_entity
    end
  end

  def teacher_params
    params.require(:teacher).permit(:full_name, user_attributes: [:id, :username, :password, :password_confirmation, :role])
  end
end
