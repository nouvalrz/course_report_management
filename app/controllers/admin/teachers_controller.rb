class Admin::TeachersController < ApplicationController
  def index
    @pagy, @teachers = pagy(Teacher.all)
  end
end
