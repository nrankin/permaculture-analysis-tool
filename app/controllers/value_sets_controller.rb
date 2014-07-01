class ValueSetsController < ApplicationController
  include ActiveModel::ForbiddenAttributesProtection
  before_action :set_value_set #, :only => [:edit, :show]
  before_action :set_project
  def show
    render "projects/show"
  end
  def edit

  end
  def update
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

  private
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
end
