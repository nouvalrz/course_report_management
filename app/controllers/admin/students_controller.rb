class Admin::StudentsController < ApplicationController
  def index
    @pagy, @students = pagy(Student.all)
  end

  def new
    @student = Student.new
  end
end
