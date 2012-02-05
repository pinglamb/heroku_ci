class HerokuCi::ProjectsController < HerokuCi::ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "You have successfully created a new project"
      redirect_to @project
    else
      render :action => :new
    end
  end
end
