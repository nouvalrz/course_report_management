class Admin::MasterClassesController < Admin::ApplicationController
  def index
    @pagy, @master_classes = pagy(MasterClass.order(:id))
  end


end
