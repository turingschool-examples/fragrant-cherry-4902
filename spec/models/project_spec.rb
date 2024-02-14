require "rails_helper"

RSpec.describe Project, type: :model do
  let!(:recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) }

  let!(:news_chic)  { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") }

  let!(:jay) { Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }

  let!(:contestant_project_1) { ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:contestant_project_2) { ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id) }

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "#contestant_count" do
    it "returns the total number of contestants in the project" do
      expect(news_chic.contestant_count).to eq(2)
    end
  end

  describe "#average_contestants_experience" do
    it "returns the average years of experiences for all contestants" do
      expect(news_chic.average_contestants_experience).to eq(12.5)
    end
  end
end
