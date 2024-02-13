require 'rails_helper'

RSpec.describe 'Projects show page', type: :feature do
  describe 'Project' do
    before(:each) do
      @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    end

    # User Story 1 of 3
    it 'displays a projects name, material and theme' do
      # As a visitor,
      # When I visit a project's show page ("/projects/:id"),
      visit "/projects/#{@news_chic.id}"
      # I see that project's name and material
      expect(page).to have_content(@news_chic.name)
      expect(page).to have_content(@news_chic.material)
      expect(page).to have_content(@recycled_material_challenge.theme)


      # And I also see the theme of the challenge that this project belongs to.


      # (e.g.    Litfit
      #     Material: Lamp Shade
      #   Challenge Theme: Apartment Furnishings)
      # ```
    end
  end
end