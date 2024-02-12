require 'rails_helper'

RSpec.describe 'Project show page' do
   it 'display the project name and material' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content(news_chic.name)
      expect(page).to have_content(news_chic.material)
   end

   it 'display the theme of the challenge that this project belongs to' do
      recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
      news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      visit "/projects/#{news_chic.id}"

      expect(page).to have_content(recycled_material_challenge.theme)
   end

   it 'displays the amount of contestants on the project' do
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
      
      visit "/projects/#{upholstery_tux.id}"

      expect(page).to have_content("Number of Contestants: 2")
   end

   it 'shows the average years of experience for the contestants that worked on that project' do
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
      ContestantProject.create(contestant_id: kentaro.id, project_id: upholstery_tux.id)
      
      visit "/projects/#{upholstery_tux.id}"

      expect(page).to have_content("Average Contestant Experience: 10")
   end
end