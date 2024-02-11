class ContestantProjectsController < ApplicationController

def new
    ContestantProject.create!(
        contestant_id: params[:add_contestant],
        project_id: params[:id]
        )

    redirect_to "/projects/#{params[:id]}"
end
end