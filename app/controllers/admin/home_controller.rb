class Admin::HomeController < Admin::ApplicationController
  before_action :authenticate_user
  before_action :authenticate_admin
end
