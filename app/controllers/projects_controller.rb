class ProjectsController < ApplicationController
  include ProjectsHelper
  include SnapshotsMaker
  include ActiveModel::ForbiddenAttributesProtection
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.where(:user_id => current_user.id)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new

  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.save

        create_initial_snapshot(@project)

        format.html { redirect_to @project, notice: t('project.success.create') }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: t('project.success.update') }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: t('project.success.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    def get_snapshot
      @snapshot = latest_snapshot(@project)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
