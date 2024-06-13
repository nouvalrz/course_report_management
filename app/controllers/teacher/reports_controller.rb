class Teacher::ReportsController < Teacher::ApplicationController

  def new
    @teacher = current_user.teacher
    @student = @teacher.students.find_by(id: params[:student_id])

    return redirect_to teacher_students_path, flash: {error: "Student not found"} if @student.nil?

    @course_enrollment = CourseEnrollment.find(params[:course_enrollment_id])
    @master_class = @course_enrollment.master_class
    @report = Report.new(student_id: @student.id, course_enrollment_id: @course_enrollment.id, teacher_id: @course_enrollment.master_class.teacher.id)
  end
  def edit

  end

  def update

  end
end
