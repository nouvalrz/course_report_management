class Teacher::StudentsController < Teacher::ApplicationController
  def index
    @teacher = current_user.teacher
    students = params[:query] ? @teacher.students.search(params[:query]).distinct : @teacher.students
    @pagy, @students = pagy(students)
  end

  def show
    @teacher = current_user.teacher
    @student = @teacher.students.find_by(id: params[:id])

    redirect_to teacher_students_path, flash: {error: "Student is not found"} if @student.nil?
  end


end
