class ContestantProjectsController < ApplicationController
  def create
    ContestantProject.create!(project_id: params[:project_id], contestant_id: params[:contestant_id])
    redirect_to "/projects/#{params[:project_id]}"
  end
end