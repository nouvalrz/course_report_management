class Teacher::HomeController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_teacher
end
