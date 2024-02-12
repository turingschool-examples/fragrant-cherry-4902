require 'rails_helper'

RSpec.describe 'Contestants Index Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @chal_1 = Challenge.create!(theme: "coding", project_budget: 100)
      
      @p_1 = @chal_1.projects.create!(name: "Week 2 ic", material: "rails")
      @p_2 = @chal_1.projects.create!(name: "How to fly", material: "react")

      @contest_1 = Contestant.create!(name: "Joey", age: 17, hometown: "Gotham", years_of_experience: 3)
      @contest_2 = Contestant.create!(name: "Cindy Lou", age: 99, hometown: "Whoville", years_of_experience: 5)

      ContestantProject.create!(contestant_id: @contest_1.id, project_id: @p_1.id)
      ContestantProject.create!(contestant_id: @contest_2.id, project_id: @p_2.id)
    end

    # User Story 2 
    it 'displays the contestants and the projects they work on' do
      # When I visit the contestants index page ("/contestants")
      visit "/contestants"
      # I see a list of names of all the contestants
      # And under each contestants name I see a list of the projects (names) that they've been on
      within "#contestant-#{@contest_1.id}" do
        expect(page).to have_content(@contest_1.name)
        expect(page).to have_content(@contest_1.projects.first.name)
      end
      
      within "#contestant-#{@contest_2.id}" do
        expect(page).to have_content(@contest_2.name)
        expect(page).to have_content(@contest_2.projects.first.name)
      end  
    end
  end
end