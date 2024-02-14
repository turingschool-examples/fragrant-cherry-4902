require "rails_helper"

RSpec.describe Contestant, type: :model do

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

  describe 'instance method' do
   describe 'project name' do
     it 'plucks out the project name from a contestant' do
        challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)

        project_1 = challenge_1.projects.create(name: "News Chic", material: "Newspaper")
        project_2 = challenge_1.projects.create(name: "Boardfit", material: "Cardboard Boxes")

        contestant_1 = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)

        ContestantProject.create(contestant_id: contestant_1.id, project_id: project_1.id)
        ContestantProject.create(contestant_id: contestant_1.id, project_id: project_2.id)

        
       expect(contestant_1.project_names).to eq([project_1.name,project_2.name])
     end
   end
  end
end
