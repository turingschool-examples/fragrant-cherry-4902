require 'rails_helper'

RSpec.describe "Project show page" do
    it "shows Project name, material, and theme" do
        # User Story 1 of 3
        challenge = Challenge.create!(theme: "Apartment Furnishings")
        project = challenge.projects.create!(name: "Litfit", material: "Lamp Shade")
        # As a visitor,
        # When I visit a project's show page ("/projects/:id"),
        visit "/projects/#{project.id}"
        # I see that project's name and material
        expect(page).to have_content(project.name)
        expect(page).to have_content(project.material)
        # And I also see the theme of the challenge that this project belongs to.
        expect(page).to have_content(challenge.theme)
        # (e.g.    Litfit
        #     Material: Lamp Shade
        #   Challenge Theme: Apartment Furnishings)

    end
end