require 'rails_helper'

RSpec.describe "Contestant Index Page", type: :feature do
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
      visit "/contestants"
    end

    it "lists all contestants' names" do
      expect(page).to have_content(contestant_1.name)
      expect(page).to have_content(contestant_2.name)
      expect(page).to have_content(contestant_3.name)
    end

    it "lists contestant's projects" do
      within "#contestant_#{contestant_1.id}" do
        expect(page).to have_content(project_1.name)
      end
      
      within "#contestant_#{contestant_2.id}" do
        expect(page).to have_content(project_1.name)
        expect(page).to have_content(project_2.name)
      end

      within "#contestant_#{contestant_3.id}" do
        expect(page).to have_content(project_3.name)
      end
    end
  end
end