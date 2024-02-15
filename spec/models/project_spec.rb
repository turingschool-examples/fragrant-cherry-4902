require "rails_helper"

RSpec.describe Project, type: :model do

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "instance methods" do
    it "#contestant_list shoud return a count of all contestants associated with project" do
      @challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @project_1 = @challenge.projects.create(name: "Litfit", material: "Lamp")
      @project_2 = @challenge.projects.create(name: "Cushion It", material: "Couch")
        
      @nico = Contestant.create!(name: "Nico", age: 39, hometown: "Florida", years_of_experience: 1)
      @jenna = Contestant.create!(name: "Jenna", age: 37, hometown: "Miami", years_of_experience: 3)
      @wolf = Contestant.create!(name: "Wolf", age: 2, hometown: "Island of Maui", years_of_experience: 2)
      
      # project_1 = 2
      ContestantProject.create!(contestant_id: @nico.id, project_id: @project_1.id)
      ContestantProject.create!(contestant_id: @jenna.id, project_id: @project_1.id)
      # project_2 = 1
      ContestantProject.create!(contestant_id: @wolf.id, project_id: @project_2.id)
      
      expect(@project_1.contestant_count).to eq(2)
      expect(@project_2.contestant_count).to eq(1)

    end
  end
end
