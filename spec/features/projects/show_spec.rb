require 'rails_helper'

RSpec.describe 'Project Show Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @chal_1 = Challenge.create!(theme: "coding", project_budget: 100)
      
      @p_1 = @chal_1.projects.create!(name: "Week 2 ic", material: "rails")
      @p_2 = @chal_1.projects.create!(name: "How to fly", material: "react")

      @contest_1 = Contestant.create!(name: "Joey", age: 17, hometown: "Gotham", years_of_experience: 3)
      @contest_2 = Contestant.create!(name: "Cindy Lou", age: 99, hometown: "Whoville", years_of_experience: 5)

      ContestantProject.create!(contestant_id: @contest_1.id, project_id: @p_2.id)
      ContestantProject.create!(contestant_id: @contest_2.id, project_id: @p_2.id)
    end

    # User Story 1 
    it 'displays projects name and material' do
      # When I visit a project's show page ("/projects/:id"),
      visit "/projects/#{@p_1.id}"
      # I see that project's name and material
      expect(page).to have_content(@p_1.name)
      expect(page).to have_content(@p_1.material)
      # And I also see the theme of the challenge that this project belongs to.
      expect(page).to have_content(@p_1.challenge.theme)
      # (e.g.    Litfit
      #     Material: Lamp Shade
      #   Challenge Theme: Apartment Furnishings)
    end
    
    # User Story 3 of 3
    it "counts the contestants on a project" do 
    # When I visit a project's show page
    visit "/projects/#{@p_2.id}"
    # I see a count of the number of contestants on this project
    expect(page).to have_content(2)
    # (e.g.    Litfit
    #     Material: Lamp Shade
    #   Challenge Theme: Apartment Furnishings
    #   Number of Contestants: 3 )
    end
  end
end