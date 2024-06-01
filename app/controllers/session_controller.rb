class SessionController < ApplicationController
  layout 'login'
  def new
    redirect_home_by_role(current_user) unless current_user.nil?
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_home_by_role(@user)
    else
      flash[:alert] = "Login failed"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
