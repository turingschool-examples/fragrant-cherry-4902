class ContestantProjectsController < ApplicationController

  def create
    ContestantProject.create!(project_id: params[:project_id], contestant_id: params[:add_contestant_by_id])
    redirect_to "/projects/#{params[:project_id]}"
  end
end