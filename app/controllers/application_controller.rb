class ApplicationController < ActionController::Base
  helper_method :current_user
  # before_action :authenticate_user

  def current_user
    # If session[:user_id] is nil, set it to nil, otherwise find the user by id.
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def authenticate_user
    redirect_to login_path unless current_user
  end

  def authenticate_admin
    redirect_to(root_path, alert: 'You are not authorized to access this page.') unless current_user.role == "admin"
  end

  def authenticate_teacher
    redirect_to(root_path, alert: 'You are not authorized to access this page.') unless current_user.role == "teacher"
  end

  def redirect_home_by_role(user)
    if user.role == 'admin'
      redirect_to admin_root_path
    elsif user.role == 'teacher'
      redirect_to teacher_root_path
    end
  end
end
