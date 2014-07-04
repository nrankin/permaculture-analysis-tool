class SnapshotsController < ApplicationController
  include SnapshotsMaker
  include ActiveModel::ForbiddenAttributesProtection
  before_action :set_snapshot
  before_action :set_project

  def show
    @enabled = false
    render "projects/show"
  end

  def update

    update_values
    respond_to do |format|
      if @snapshot.update(snapshot_params)
        format.html { redirect_to [@project, @snapshot], notice: t('snapshot.success.update') }
        format.json { render :show, status: :ok, location: @snapshot }
      else
        format.html { render :edit }
        format.json { render json: @snapshot.errors, status: :unprocessable_entity }
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
        principle_id = Principle.find_by(name: key).id
        if @snapshot.values.find_by(principle_id: principle_id).update({:value => value.to_param})
          logger.debug  key.to_s + " updated successfully to " + value.to_param
        else
          logger.error "value param not updated, something went wrong"
        end
      end
    end
  end

  def set_snapshot
    @snapshot = Snapshot.find(params[:id])
  end

  def set_project
    @project =  @snapshot.project
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def snapshot_params
    params.require(:snapshot).permit(:name, :snapshot)
  end
  def values_params
    params.require(:values).permit(:ObserveAndInteract, :CatchAndStoreEnergy, :ObtainAYield, :ApplySelfRegulationAndAcceptFeedback, :UseAndValueRenewableResourcesAndServices, :ProduceNoWaste, :DesignFromPatternsToDetails, :IntegrateRatherThanSegregate, :UseSmallAndSlowSolutions, :UseAndValueDiverstiy, :UseEdgesAndValueTheMarginal, :CreativelyUseAndRespondToChange)
  end

end
