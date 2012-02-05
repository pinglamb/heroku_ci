class HerokuCi::ProjectsController < HerokuCi::ApplicationController
  def index
    @projects = Project.all
  end
end
