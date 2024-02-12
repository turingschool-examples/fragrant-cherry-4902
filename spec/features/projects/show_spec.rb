require 'rails_helper'

RSpec.describe 'Project Show Page', type: :feature do
  describe 'As a visitor' do
    before(:each) do
      @chal_1 = Challenge.create!(theme: "coding", project_budget: 100)
      @p_1 = @chal_1.projects.create!(name: "Joey", material: "rails")
      @p_2 = @chal_1.projects.create!(name: "Dean", material: "react")
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
  end
end