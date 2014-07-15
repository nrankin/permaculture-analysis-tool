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

    update_usages
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

  def update_usages
    #FIXME should be using usages_params here doh
    if params[:usages].nil?
      logger.error "no usages came through in the params"
    else
      #FIXME should be using usages_params here doh
      params[:usages].each do |key, value|
        principle_id = Principle.find_by(name: key).id
        if @snapshot.usages.find_by(principle_id: principle_id).update({:value => value.to_param})
          logger.debug  key.to_s + " updated successfully to " + value.to_param
        else
          logger.error "usage param not updated, something went wrong"
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
  def usages_params
    params.require(:usages).permit(:ObserveAndInteract, :CatchAndStoreEnergy, :ObtainAYield, :ApplySelfRegulationAndAcceptFeedback, :UseAndValueRenewableResourcesAndServices, :ProduceNoWaste, :DesignFromPatternsToDetails, :IntegrateRatherThanSegregate, :UseSmallAndSlowSolutions, :UseAndValueDiversity, :UseEdgesAndValueTheMarginal, :CreativelyUseAndRespondToChange)
  end

end
