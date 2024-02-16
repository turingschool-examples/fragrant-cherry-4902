require "rails_helper"

RSpec.describe Project, type: :model do

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
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
    it "counts the number of contestants working on each respective project" do
      expect(@project_1.project_contestant_count).to eq(3)
      expect(@project_2.project_contestant_count).to eq(2)
      expect(@project_3.project_contestant_count).to eq(2)
    end
  end
end
