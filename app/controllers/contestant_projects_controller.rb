class ContestantProjectsController < ApplicationController
  def new

  end

  def create
    project = Project.find(params[:id])
    contestant = Contestant.find(params[:contestant_id])
    contestant_project = ContestantProject.create!(project: project, contestant: contestant)
    redirect_to "/projects/#{project.id}"
  end
end
