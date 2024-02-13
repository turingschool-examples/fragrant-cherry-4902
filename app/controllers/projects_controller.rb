class ProjectsController < ApplicationController

  def show
    @proj = Project.find(params[:id])
    @chal = @proj.challenge
  end

end