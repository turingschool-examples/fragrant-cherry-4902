require 'rails_helper'

RSpec.describe "Contestants Index Page", type: :feature do
    before(:each) do
        challenge = Challenge.create!(theme: "First Challenge", project_budget: 10000)
        
        contestant1 = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Tokyo")
        contestant2 = Contestant.create!(name: "Jay McCarroll", age: 35, hometown: "LA")
        
        project1 = Project.create!(name: "Litfit", challenge: challenge)
        project2 = Project.create!(name: "Rug Tuxedo", challenge: challenge)
        project3 = Project.create!(name: "LeatherFeather", challenge: challenge)
        
        ContestantProject.create!(contestant: contestant1, project: project1)
        ContestantProject.create!(contestant: contestant1, project: project2)
        ContestantProject.create!(contestant: contestant2, project: project3)
    end
    
    # User story 2 As a visitor,
    it 'shows all contestants and their projects' do
        # When I visit the contestants index page ("/contestants")
        visit '/contestants'
        
        # I see a list of names of all the contestants
        expect(page).to have_content("Kentaro Kameyama")
        expect(page).to have_content("Jay McCarroll")
        # And under each contestants name I see a list of the projects (names) that they've been on
        expect(page).to have_content("Projects: Litfit, Rug Tuxedo")
        expect(page).to have_content("Projects: LeatherFeather")
    end
end
