class ContestantProjectsController < ApplicationController
  def create
    contestant_project = ContestantProject.new(contestant_project_params)
    if contestant_project.save
      redirect_to show_projects_path(params[:project_id])
    end
  end

  private

  def contestant_project_params
    params.permit(:contestant_id, :project_id)
  end
end
