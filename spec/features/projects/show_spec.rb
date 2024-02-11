require 'rails_helper'

RSpec.describe 'Project show page' do

    it 'displays project name and material and the challenge it belongs to' do
        furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

        # User Story 1 of 3

        # As a visitor,
        # When I visit a project's show page ("/projects/:id"),
        visit "/projects/#{lit_fit.id}"
        # I see that project's name and material
        expect(page).to have_content("Litfit")
        expect(page).to have_content("Lamp")
        # And I also see the theme of the challenge that this project belongs to.
        expect(page).to have_content("Apartment Furnishings")
        # (e.g.    Litfit
        #     Material: Lamp Shade
        # Challenge Theme: Apartment Furnishings)
    end
end