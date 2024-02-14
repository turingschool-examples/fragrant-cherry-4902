require "rails_helper"

RSpec.describe "Contestants index" do

  describe 'US 2' do
    describe 'Contestants index' do
      it 'displays list of names of all contestants' do
        challenge_1 = Challenge.create(theme: "Recycled Material", project_budget: 1000)
        challenge_2 = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

        project_1 = challenge_1.projects.create(name: "News Chic", material: "Newspaper")
        project_2 = challenge_1.projects.create(name: "Boardfit", material: "Cardboard Boxes")

        contestant_1 = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
        contestant_2 = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)

        ContestantProject.create(contestant_id: contestant_1.id, project_id: project_1.id)
        ContestantProject.create(contestant_id: contestant_2.id, project_id: project_2.id)

        visit "/contestants"

        within("#contestant-#{contestant_1.id}") do
          expect(page).to have_content(contestant_1.name)
          expect(page).to have_content(project_1.name)
        end

        within("#contestant-#{contestant_2.id}") do
          expect(page).to have_content(contestant_2.name)
          expect(page).to have_content(project_2.name)
        end
  
      end
    end
  end
end