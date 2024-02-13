require 'rails_helper'

RSpec.describe 'Project Show Page' do
    # US 1
    it 'has a show page that displays a projects name and material and theme' do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

        visit "/projects/#{news_chic.id}"

        expect(page).to have_content("News Chic") # name
        expect(page).to have_content("Newspaper") # material
        expect(page).to have_content("Recycled Material") # challenge theme
    end


# As a visitor,
# When I visit a project's show page ("/projects/:id"),
# I see that project's name and material
# And I also see the theme of the challenge that this project belongs to.
# (e.g.    Litfit
#     Material: Lamp Shade
#   Challenge Theme: Apartment Furnishings)
end