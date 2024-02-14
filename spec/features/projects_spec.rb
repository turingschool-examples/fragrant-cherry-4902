require 'rails_helper'

RSpec.describe "Projects show", type: :feature do
    describe 'project#show' do
        it 'shows the projects, material, and theme' do
            # (e.g. name: Litfit, Material: Lamp Shade, Challenge Theme: Apartment Furnishings)
            furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
            lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")
            # When I visit a project's show page ("/projects/:id"),
            visit "/projects/#{lit_fit.id}"
            # I see that project's name and material
            expect(page).to have_content(lit_fit.name)
            expect(page).to have_content(lit_fit.material)
            # And I also see the theme of the challenge that this project belongs to.
            expect(page).to have_content(furniture_challenge.theme)
        end

    end
end