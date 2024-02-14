require 'rails_helper'

RSpec.describe "Project Show Page" do
  let!(:recycled_material_challenge) { Challenge.create(theme: "Recycled Material", project_budget: 1000) }

  let!(:news_chic)  { recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper") }

  let!(:jay) { Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13) }
  let!(:gretchen) { Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12) }
  let!(:erin) { Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15) }

  let!(:contestant_project_1) { ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id) }
  let!(:contestant_project_2) { ContestantProject.create(contestant_id: gretchen.id, project_id: news_chic.id) }

  describe "As a visitor" do
    describe "When I visit a project's show page" do
      it "shows the project's name, material and the theme of the challenge that this project belongs to" do
        visit "/projects/#{news_chic.id}"

        expect(page).to have_content(news_chic.name)
        expect(page).to have_content(news_chic.material)
        expect(page).to have_content(recycled_material_challenge.theme)
      end

      it "shows a count of the number of contestants on this project" do
        visit "/projects/#{news_chic.id}"

        expect(page).to have_content("Number of Contestants: 2")
      end

      it "shows the average years of experiences for the contestants that worked on that project" do
        visit "/projects/#{news_chic.id}"

        expect(page).to have_content("12.5 years")
      end

      it "sees a form to add contestant to the project" do
        visit "/projects/#{news_chic.id}"

        expect(page).to have_content("Number of Contestants: 2")

        fill_in "Contestant ID:", with: "#{erin.id}"
        click_on "Add Contestant to Project"

        expect(page).to have_content("Number of Contestants: 3")

        visit "/contestants"

        within "contestant-#{erin.id}"
        expect(page).to have_content(erin.name)
        expect(page).to have_content(news_chic.name)
      end
    end
  end
end
