require 'rails_helper'

RSpec.describe 'Projects show page', type: :feature do
  describe 'Project' do
    before(:each) do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

      @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

      ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
      ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)

    end

    # User Story 1 of 3
    it 'displays a projects name, material and theme' do
      # As a visitor,
      # When I visit a project's show page ("/projects/:id"),
      visit "/projects/#{@news_chic.id}"
      # I see that project's name and material
      # And I also see the theme of the challenge that this project belongs to.
      expect(page).to have_content(@news_chic.name)
      expect(page).to have_content(@news_chic.material)
      expect(page).to have_content(@recycled_material_challenge.theme)
    end

    # User Story 3 of 3
    it 'shows how many contestants are in this project' do
      # As a visitor,
      # When I visit a project's show page
      visit "/projects/#{@news_chic.id}"
      # I see a count of the number of contestants on this project
        expect(page).to have_content("Number of Contestants: 2")
      # (e.g.    Litfit
      #     Material: Lamp Shade
      #   Challenge Theme: Apartment Furnishings
      #   Number of Contestants: 3 )
    end
  end
end