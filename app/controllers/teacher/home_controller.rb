class Teacher::HomeController < Teacher::ApplicationController
  def index
    teacher = current_user.teacher
    @master_classes_count = teacher.master_classes.count
    @students_count = teacher.master_classes.sum {| master_class|  master_class.students.count}
  end
end
