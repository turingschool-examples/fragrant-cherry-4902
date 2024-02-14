require "rails_helper"

RSpec.describe Project, type: :model do

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe '#instance method' do
    it 'counts number of contestants on a project' do
      challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      project_1 = challenge_1.projects.create(name: "News Chic", material: "Newspaper")
      project_2 = challenge_1.projects.create(name: "Boardfit", material: "Cardboard Boxes")

      contestant_1 = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)

      ContestantProject.create(contestant_id: contestant_1.id, project_id: project_1.id)
      ContestantProject.create(contestant_id: contestant_1.id, project_id: project_2.id)
      
      expect(project_1.contestant_count).to eq(1)
    end
  end

end
