class ProjectsController < ApplicationController
    
    def show
        @project = Project.find(params[:id])
        @project_count = Project.count_projects
    end
end