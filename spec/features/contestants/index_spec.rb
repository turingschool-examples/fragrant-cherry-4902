require 'rails_helper'

RSpec.describe "contestants index page" do
    it "render an index page with all contestants names" do
        # User Story 2 of 3
        # challenge = Challenge.create!(theme: "Apartment Furnishings")
        # project_1 = Project.create!(name: "Litfit", material: "Lamp Shade", challenge_id: 3)
        # project_2 = Project.create!(name: "Rug Tuxedo", material: "string", challenge_id: 3)
        # project_3 = Project.create!(name: "LeatherFeather", material: "Lether", challenge_id: 4)
        contestant_1 = Contestant.create!(name: "Kentaro Kameyama", age: 5, hometown: "Las Vagas", years_of_experience: 10)
        contestant_2 = Contestant.create!(name: "Jay McCarroll", age: 5, hometown: "New York City", years_of_experience: 3)
        # As a visitor,
        # When I visit the contestants index page ("/contestants")
        visit "/contestants"
        # I see a list of names of all the contestants
        expect(page).to have_content(contestant_1.name)
        expect(page).to have_content(contestant_2.name)
        # And under each contestants name I see a list of the projects (names) that they've been on
        expect(page).to have_content(contestant_1.project)
        expect(page).to have_content(contestant_2.project)
        
        # (e.g.   Kentaro Kameyama
        #         Projects: Litfit, Rug Tuxedo
        
        #         Jay McCarroll
        #         Projects: LeatherFeather)
    end
end