class ContestantsController < ApplicationController
  def index
    @contestants = Contestant.all
    @projects = Project.all
  end
end