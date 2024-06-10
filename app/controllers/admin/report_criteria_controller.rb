class Admin::ReportCriteriaController < Admin::ApplicationController
  def index
    report_criteria = params[:query] ? ReportCriterium.search(params[:query]) : ReportCriterium.order(:id)
    @pagy, @report_criteria = pagy(report_criteria)
  end

  def new
    @report_criterium = ReportCriterium.new
  end

  def create
    @report_criterium = ReportCriterium.create(report_criterium_params)

    if @report_criterium.valid?
      redirect_to admin_report_criteria_path, flash: {success: "Criterium successfully added"}
    else
      flash.now[:error] = @report_criterium.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    begin
      @report_criterium = ReportCriterium.find(params[:id])
    rescue
      redirect_to admin_report_criteria_path, flash: {error: "Criterium not found"}
    end
  end

  def update
    @report_criterium = ReportCriterium.find(params[:id])

    if @report_criterium.update(report_criterium_params)
      redirect_to edit_admin_report_criterium_path(@report_criterium), flash: {success: "Successfully edit criterium"}
    else
      flash.now[:error] = @report_criterium.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def report_criterium_params
    params.require(:report_criterium).permit(:id, :title, :is_active)
  end


end
