require 'rails_helper'

RSpec.describe "Project Show Page", type: :feature do
  describe "As a visitor" do
    let!(:challenge_1) {Challenge.create!(theme: "Apartment Furnishings", project_budget: 550)}
    let!(:challenge_2) {Challenge.create!(theme: "Toys", project_budget: 650)}

    let!(:project_1) {challenge_1.projects.create!(name: "Litfit", material: "Lamp Shade")}
    let!(:project_2) {challenge_1.projects.create!(name: "Projection", material: "Lights")}
    let!(:project_3) {challenge_2.projects.create!(name: "Playhouse", material: "Legos")}

    let!(:contestant_1) {Contestant.create!(name: "Amanda", age: 32, hometown: "Indianapolis", years_of_experience: 5)}
    let!(:contestant_2) {Contestant.create!(name: "Alice", age: 54, hometown: "Louisville", years_of_experience: 15)}
    let!(:contestant_3) {Contestant.create!(name: "Amy", age: 41, hometown: "St. Louis", years_of_experience: 8)}

    let!(:contestant_projects_1) {ContestantProject.create!(contestant: contestant_1, project: project_1)}
    let!(:contestant_projects_2) {ContestantProject.create!(contestant: contestant_2, project: project_1)}
    let!(:contestant_projects_3) {ContestantProject.create!(contestant: contestant_2, project: project_2)}
    let!(:contestant_projects_4) {ContestantProject.create!(contestant: contestant_3, project: project_3)}
    
    before do
      visit "/projects/#{project_1.id}"
    end

    it "displays project name" do
      expect(page).to have_content(project_1.name)
      expect(page).to_not have_content(project_2.name)
    end

    it "displays project material" do
      expect(page).to have_content(project_1.material)
      expect(page).to_not have_content(project_2.material)
    end

    it "display's challenge's theme" do
      expect(page).to have_content(challenge_1.theme)
      expect(page).to_not have_content(challenge_2.theme)
    end

    it "displays number of project contestants" do
      expect(page).to have_content("Number of Contestants: 2")
    end
  end
end