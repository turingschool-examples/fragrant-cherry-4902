require "rails_helper"

RSpec.describe Contestant, type: :model do

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  before :each do

    @challenge_1 = Challenge.create!(theme: "Recycled Material", project_budget: 1000)

    @project_1 = @challenge_1.projects.create!(name: "News Chic", material: "Newspaper")
    @project_2 = @challenge_1.projects.create!(name: "Boardfit", material: "Cardboard Boxes")
    @project_3 = @challenge_1.projects.create!(name: "Vintage Chic", material: "Denim")

    @contestant_1 = Contestant.create!(name: "Yves Saint Laurent", age: 71, hometown: "Paris", years_of_experience: 58)
    @contestant_2 = Contestant.create!(name: "Coco Chanel", age: 87, hometown: "Saumur", years_of_experience: 73)
    @contestant_3 = Contestant.create!(name: "Kanye West", age: 46, hometown: "Atlanta", years_of_experience: 13)

    ContestantProject.create!(contestant_id: @contestant_1.id, project_id: @project_1.id)
    ContestantProject.create!(contestant_id: @contestant_1.id, project_id: @project_2.id)  
    ContestantProject.create!(contestant_id: @contestant_2.id, project_id: @project_1.id)
    ContestantProject.create!(contestant_id: @contestant_2.id, project_id: @project_3.id)
    ContestantProject.create!(contestant_id: @contestant_3.id, project_id: @project_1.id)
    ContestantProject.create!(contestant_id: @contestant_3.id, project_id: @project_2.id) 
    ContestantProject.create!(contestant_id: @contestant_3.id, project_id: @project_3.id) 

  end

  describe "instance methods" do
    it "returns all projects worked on by a respective contestant" do
      expect(@contestant_1.contestant_project_names).to eq ["News Chic", "Boardfit"]
      expect(@contestant_2.contestant_project_names).to eq ["News Chic", "Vintage Chic"]
      expect(@contestant_3.contestant_project_names).to eq ["News Chic", "Boardfit", "Vintage Chic"]
    end
  end
end
