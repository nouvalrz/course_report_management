class PagesController < ApplicationController
  before_action :authenticate_user
  def index
    redirect_home_by_role(current_user)
  end
end
