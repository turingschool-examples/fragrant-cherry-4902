require "rails_helper"

RSpec.describe Contestant, type: :model do

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "Instance Methods" do
    describe "#find_contestant_projects" do
      it 'can return all projects associated with a contestant' do
        jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
        erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
        upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
        lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

        ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
        ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
        ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
        ContestantProject.create(contestant_id: erin.id, project_id: lit_fit.id)

        expect(jay.find_contestant_projects).to eq([news_chic])
        expect(gretchen.find_contestant_projects).to eq([upholstery_tux])
        expect(kentaro.find_contestant_projects).to eq([boardfit])
        expect(erin.find_contestant_projects).to eq([lit_fit])
      end
    end
  end
end
