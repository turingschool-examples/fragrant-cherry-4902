require 'rails_helper'

RSpec.describe 'Contestants index page' do
    describe 'User story 2' do
        it 'displays name of contestants and their projects' do
            jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
            gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
            kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

            recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

            news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
            boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

            jay.projects << [news_chic, boardfit]
            gretchen.projects << boardfit
            kentaro.projects << [news_chic, boardfit]
            # As a visitor,
            # When I visit the contestants index page ("/contestants")
            visit "/contestants"
            # I see a list of names of all the contestants
            expect(page).to have_content("Jay McCarroll")
            expect(page).to have_content("Gretchen Jones")
            expect(page).to have_content("Kentaro Kameyama")
            # And under each contestants name I see a list of the projects (names) that they've been on
            within("#contestant-#{jay.id}") do
                expect(page).to have_content("News Chic")
                expect(page).to have_content("Boardfit")
            end

            within("#contestant-#{gretchen.id}") do
                expect(page).to have_content("Boardfit")
            end

            within("#contestant-#{kentaro.id}") do
                expect(page).to have_content("News Chic")
                expect(page).to have_content("Boardfit")
            end

            # (e.g.   Kentaro Kameyama
            #         Projects: Litfit, Rug Tuxedo

            #         Jay McCarroll
            #         Projects: LeatherFeather)
        end
    end
end