class Teacher::ReportsController < Teacher::ApplicationController
  before_action :set_teacher_and_student, only: [:new, :create, :edit, :update]
  before_action :set_report, only: [:edit, :update]

  def new
    @course_enrollment = CourseEnrollment.find(params[:course_enrollment_id])
    @report = Report.new(student_id: @student.id, course_enrollment_id: @course_enrollment.id, teacher_id: @teacher.id)
    @report.report_details.build
  end

  def create
    @report = Report.new(report_params.merge(teacher_id: @teacher.id, student_id: @student.id, course_enrollment_id: params[:course_enrollment_id]))

    if @report.save
      @report.calculateAvgScore
      redirect_to teacher_student_path(@student), flash: {success: "Report successfully submitted"}
    else
      flash.now[:error] = @report.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @course_enrollment = CourseEnrollment.find(params[:course_enrollment_id])
  end

  def update
    if @report.update(report_params)
      @report.calculateAvgScore
      redirect_to teacher_student_path(@student), flash: {success: "Report successfully updated"}
    else
      flash.now[:error] = @report.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_teacher_and_student
    @teacher = current_user.teacher
    @student = @teacher.students.find_by(id: params[:student_id])
    redirect_to teacher_students_path, flash: {error: "Student not found"} if @student.nil?
  end

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(report_details_attributes: [:id, :report_criterium_id, :description, :score, :_destroy])
  end
end