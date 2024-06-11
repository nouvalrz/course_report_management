class Teacher::ApplicationController < ApplicationController
  before_action :authenticate_user
  before_action :authenticate_teacher
end