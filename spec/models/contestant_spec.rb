require "rails_helper"

RSpec.describe Contestant, type: :model do
  
  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe "instance methods" do
    before :each do
        @challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        @project_1 = @challenge.projects.create(name: "Litfit", material: "Lamp")
        @project_2 = @challenge.projects.create(name: "Cushion It", material: "Couch")
        @project_3 = @challenge.projects.create(name: "Cooking", material: "Cookware")

        @nico = Contestant.create!(name: "Nico", age: 39, hometown: "Florida", years_of_experience: 1)
        @jenna = Contestant.create!(name: "Jenna", age: 37, hometown: "Miami", years_of_experience: 3)
        
        #join projects and contestants
        # Nico - project 1 and 2
        # Jenna - project 1 and 3
        ContestantProject.create!(contestant_id: @nico.id, project_id: @project_1.id)
        ContestantProject.create!(contestant_id: @nico.id, project_id: @project_2.id)
        ContestantProject.create!(contestant_id: @jenna.id, project_id: @project_1.id)
        ContestantProject.create!(contestant_id: @jenna.id, project_id: @project_3.id)
        ContestantProject.create!(contestant_id: @jenna.id, project_id: @project_2.id)
    end
    
    it "#project_list should return sentence with all projects worked on" do
      expect(@nico.project_list).to eq("Litfit and Cushion It")
      expect(@jenna.project_list).to eq("Litfit, Cushion It, and Cooking")
    end
  end
end
