require "rails_helper"

RSpec.describe "Contestants Index Page", type: :feature do
  before do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp Shade")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create(contestant_id: @jay.id, project_id: @lit_fit.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @lit_fit.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @boardfit.id)

    @contestants = Contestant.all
    visit contestants_path
  end

  describe "User Story 2" do
    it "lists the names of all contestants and projects they've been on" do
      expect(page).to have_content("All Contestants:")
      expect(page).to have_content("Gretchen Jones")
      expect(page).to have_content("Erin Robertson")

      within "#contestant-#{@jay.id}" do
        expect(page).to have_content("Jay McCaroll")
        expect(page).to have_content("Projects: Litfit")
      end

      within "#contestant-#{@kentaro.id}" do
        expect(page).to have_content("Kentaro Kameyama")
        expect(page).to have_content("Projects: Upholstery Tuxedo, Boardfit")
      end
    end
  end
end
