require 'rails_helper'

RSpec.describe "Contestants Index Page" do
  let!(:recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) }

  let!(:news_chic)  { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") }
  let!(:boardfit) { recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes") }

  let!(:jay) { Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:erin) { Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }

  let!(:contestant_project_1) { ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:contestant_project_2) { ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id) }
  let!(:contestant_project_3) { ContestantProject.create(contestant_id: gretchen.id, project_id: boardfit.id) }

  describe "As a visitor" do
    it "shows a list of contestants' names and under each name there is a list of projects' names that they've been on" do
      visit "/contestants"

      within "contestant-#{jay.id}"
      expect(page).to have_content(jay.name)
      expect(page).to have_content(news_chic.name)

      within "contestant-#{gretchen.id}"
      expect(page).to have_content(gretchen.name)
      expect(page).to have_content(news_chic.name)
      expect(page).to have_content(boardfit.name)
    end
  end
end
