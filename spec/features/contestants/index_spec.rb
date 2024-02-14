require 'rails_helper'

RSpec.describe 'contestant index page', type: :feature do
  describe 'visitor' do
    it 'displays a list of names of all the contestants' do
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
    # User Story 2 of 3
      # As a visitor,
      # When I visit the contestants index page ("/contestants")
      visit "/contestants"
      # I see a list of names of all the contestants
      # And under each contestants name I see a list of the projects (names) that they've been on
      within "#contestant-#{jay.id}" do
        expect(page).to have_content(jay.name)
        expect(page).to have_content(news_chic.name)
        expect(page).not_to have_content(upholstery_tux.name)
      end

      within "#contestant-#{gretchen.id}" do
        expect(page).to have_content(upholstery_tux.name)
        expect(page).to have_content(news_chic.name)
        expect(page).not_to have_content("Boardfit")
      end

      # (e.g.   Kentaro Kameyama
      #         Projects: Litfit, Rug Tuxedo

      #         Jay McCarroll
      #         Projects: LeatherFeather)
    end
  end
end