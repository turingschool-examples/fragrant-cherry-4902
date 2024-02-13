class ContestantsController < ApplicationController
    def index
      @contestants = Contestant.includes(:projects).all
    end
end