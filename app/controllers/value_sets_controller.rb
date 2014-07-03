class ValueSetsController < ApplicationController
  include ValueSetMaker
  include ActiveModel::ForbiddenAttributesProtection
  before_action :set_value_set
  before_action :set_project

  def show
    @enabled = false
    render "projects/show"
  end

  def update

    update_values
    respond_to do |format|
      if @value_set.update(value_set_params)
        format.html { redirect_to [@project, @value_set], notice: 'Snapshot was successfully updated.' }
        format.json { render :show, status: :ok, location: @value_set }
      else
        format.html { render :edit }
        format.json { render json: @value_set.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_values
    if params[:ObserveAndInteract].nil?
      logger.error "first value param nil - probably means the rest are too"
    else
      if @value_set.values.first.update({:value => params[:ObserveAndInteract]})
        logger.debug  "first value updated successfully: " + @value_set.values.first.value.to_s
      else
        logger.error "first value param not updated"
      end
      if  @value_set.values.find_by(element_id: 2).update({:value => params[:CatchAndStoreEnergy]})
        logger.debug "second value updated successfully: " + @value_set.values.find_by(element_id: 2).value.to_s
      else
        logger.error "second value param not updated"
      end
    end
  end

  def edit
    @enabled = true
  end

  private

  def set_value_set
    @value_set = ValueSet.find(params[:id])
  end

  def set_project
    @project =  @value_set.project
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def value_set_params
    params.require(:value_set).permit(:name, :snapshot, :ObserveAndInteract, :CatchAndStoreEnergy, :ObtainAYield, :ApplySelfRegulationAndAcceptFeedback, :UseAndValueRenewableResourcesAndServices, :ProduceNoWaste, :DesignFromPatternsToDetails, :IntegrateRatherThanSegregate, :UseSmallAndSlowSolutions, :UseAndValueDiverstiy, :UseEdgesAndValueTheMarginal, :CreativelyUseAndRespondToChange)
  end

end
