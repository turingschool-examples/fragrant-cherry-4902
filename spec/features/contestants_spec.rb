require 'rails_helper'

RSpec.describe "Contestants index", type: :feature do
    describe 'contestants#index' do
        it 'shows a list of all names of all the contestants and a list of projets they have been on' do
            jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
            gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
            kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
            erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
            
            recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
            furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

            news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
            boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

            upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
            lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

            ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
            ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
            ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
            ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
            ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
            ContestantProject.create(contestant_id: erin.id, project_id: boardfit.id)
            
            # When I visit the contestants index page ("/contestants")
            visit "/contestants"
            # I see a list of names of all the contestants
            # # And under each contestants name I see a list of the projects (names) that they've been on
            Contestant.all.each do |contestant|
                # Expect contestant name
                expect(page).to have_content(contestant.name)

                # Expect projects list after name
                projects = @contestant.projects.map(&:name).join(", ")
                expect(page).to have_content("#{@contestant.name} - Projects: #{projects}")
            end
            # expect(page).to have_content(jay.name)
            # expect(page).to have_content(gretchen.name)
            # expect(page).to have_content(kentaro.name)
            # expect(page).to have_content(erin.name)
            # expect(page).to have_content(jay.projects.all.name)
            # expect(page).to have_content(gretchen.projects.all.name)
            # expect(page).to have_content(gretchen.projects.all.name)
            # expect(page).to have_content(kentaro.projects.all.name)
            # expect(page).to have_content(erin.projects.all.name)
        end
    end
end