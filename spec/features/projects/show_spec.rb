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

    # US 3
    it 'shows the number of contestants' do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
        boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

        jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

        ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
        ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)

        visit "/projects/#{news_chic.id}"
        
        expect(page).to have_content(2) # number of contestants associated with news_chic
    end
end 

