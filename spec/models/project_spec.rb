require "rails_helper"

RSpec.describe Project, type: :model do

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "instance methods" do
    let!(:challenge_1) {Challenge.create!(theme: "Apartment Furnishings", project_budget: 550)}
    let!(:project_1) {challenge_1.projects.create!(name: "Litfit", material: "Lamp Shade")}
    let!(:contestant_1) {Contestant.create!(name: "Amanda", age: 32, hometown: "Indianapolis", years_of_experience: 5)}
    let!(:contestant_2) {Contestant.create!(name: "Alice", age: 54, hometown: "Louisville", years_of_experience: 15)}
    let!(:contestant_projects_1) {ContestantProject.create!(contestant: contestant_1, project: project_1)}
    let!(:contestant_projects_2) {ContestantProject.create!(contestant: contestant_2, project: project_1)}

    it "list challenge's theme" do
      expect(project_1.challenge_theme).to eq("Apartment Furnishings")
    end

    it "counts project's contestants" do
      expect(project_1.contestant_count).to eq(2)
    end
  end
end
