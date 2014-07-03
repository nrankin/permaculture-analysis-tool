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

  def edit
    @enabled = true
  end

  private

  def update_values
    if params[:values].nil?
      logger.error "no values came through in the params"
    else
      params[:values].each do |key, value|
        element_id = Element.find_by(name: key).id
        if @value_set.values.find_by(element_id: element_id).update({:value => value.to_param})
          logger.debug  key.to_s + " updated successfully to " + value.to_param
        else
          logger.error "value param not updated, something went wrong"
        end
      end
    end
  end

  def set_value_set
    @value_set = ValueSet.find(params[:id])
  end

  def set_project
    @project =  @value_set.project
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def value_set_params
    params.require(:value_set).permit(:name, :snapshot)
  end
  def values_params
    params.require(:values).permit(:ObserveAndInteract, :CatchAndStoreEnergy, :ObtainAYield, :ApplySelfRegulationAndAcceptFeedback, :UseAndValueRenewableResourcesAndServices, :ProduceNoWaste, :DesignFromPatternsToDetails, :IntegrateRatherThanSegregate, :UseSmallAndSlowSolutions, :UseAndValueDiverstiy, :UseEdgesAndValueTheMarginal, :CreativelyUseAndRespondToChange)
  end

end
