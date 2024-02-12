class ProjectsController < ApplicationController
   def show
      @project = Project.find(params[:id])
      @average_experience = @project.contestants_avg_xp
   end
end
