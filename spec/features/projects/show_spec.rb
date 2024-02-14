require "rails_helper"

RSpec.describe "Project show page" do
  
  describe 'US 1' do
    describe 'project show page' do
      it 'shows project names and material' do
        challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        challenge_2 = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        project_1 = challenge_1.projects.create(name: "News Chic", material: "Newspaper")
        project_2 = challenge_1.projects.create(name: "Boardfit", material: "Cardboard Boxes")

        visit "/projects/#{project_1.id}"

        expect(page).to have_content(project_1.name)
        expect(page).to have_content(project_1.material)
        expect(page).to have_content(challenge_1.theme)

        # save_and_open_page


      end
    end
  end
end