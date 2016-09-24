class ProjectsController < ApplicationController
  before_action :require_login
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_attributes)
    @project.user = current_user
    if @project.save
      redirect_to :activities, notice: 'Project Saved!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @project.assign_attributes(project_attributes)
    if @project.save
      flash[:success] = 'Project Updated!'
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to :activities
  end

  private

  def project_attributes
    params.require(:project).permit(:name)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
