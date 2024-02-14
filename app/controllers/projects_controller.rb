class ProjectsController < ApplicationController

    def show
        @project = Project.find(params[:id])
        @theme = @project.challenge.theme
    end
end