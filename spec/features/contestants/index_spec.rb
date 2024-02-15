require 'rails_helper'

RSpec.describe "Contestants Index", type: :feature do
    # As a visitor,
    # When I visit the contestants index page ("/contestants")
    # I see a list of names of all the contestants
    # And under each contestants name I see a list of the projects (names) that they've been on
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
    end
    it 'shows a list of all names of all the contestants when visiting index page' do
        visit "/contestants"

        expect(page).to have_content("All Contestants")
        expect(page).to have_content(@nico.name)
        expect(page).to have_content(@jenna.name)
    end

    it "should show the list of projects each contestant has been in under name" do
        visit "/contestants"

        within "#contestant-#{@nico.id}" do
            expect(page).to have_content(@project_1.name)
            expect(page).to have_content(@project_2.name)
            expect(page).to_not have_content(@project_3.name)
        end
        
        within "#contestant-#{@jenna.id}" do
            expect(page).to have_content(@project_1.name)
            expect(page).to have_content(@project_3.name)
            expect(page).to_not have_content(@project_2.name)
        end
    end
end