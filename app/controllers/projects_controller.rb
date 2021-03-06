class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @employees = Employee.all
  end

  def new
    @project = Project.new
    @employees = Employee.all

    # Scoped
    @interns = Employee.intern
    @analysts = Employee.analyst
    @associates = Employee.associate
    @engagement_managers = Employee.engagement_manager
    @partners = Employee.partner
    @principals = Employee.principal

    @healthcare = Employee.healthcare
    @private_equity = Employee.private_equity
    @technology = Employee.technology
    @startup = Employee.startup
    @non_profit = Employee.non_profit
    @ecommerce = Employee.ecommerce
    @retail = Employee.retail

  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Your Project has been saved!"
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
    @employees = Employee.all
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Your project has been updated!"
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :start_date, :end_date, :project_type, :key_skill, :objective, :industry, :goals, :employee_ids => [], :role => [])
  end
end
