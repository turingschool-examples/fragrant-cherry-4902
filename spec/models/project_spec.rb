require "rails_helper"

RSpec.describe Project, type: :model do

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "Instance Methods" do
    describe '#project_challenge_theme' do
      it 'returns the theme of the challenge' do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        expect(news_chic.project_challenge_theme).to eq(recycled_material_challenge.theme)
      end
    end
  end
  
  describe "Class Methods" do
    describe "#contestant_count" do
      it 'returns the number of contestants on a project' do
        jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
        erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

        ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
        ContestantProject.create(contestant_id: erin.id, project_id: news_chic.id)
        ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)

        expect(news_chic.contestant_count).to eq(2)
        expect(upholstery_tux.contestant_count).to eq(1)
      end
    end
  end
end
