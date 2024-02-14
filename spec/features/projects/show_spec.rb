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

  describe 'US 3' do
    describe 'Projects show' do
      it 'counts of the number of contestants on this project' do
        challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

        project = challenge.projects.create(name: "News Chic", material: "Newspaper")

        contestant_1 = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        contestant_2 = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

        ContestantProject.create(contestant_id: contestant_1.id, project_id: project.id)
        ContestantProject.create(contestant_id: contestant_2.id, project_id: project.id)

        visit "/projects/#{project.id}"

        expect(page).to have_content("Number of Contestants: 2")
      end
    end
  end
end