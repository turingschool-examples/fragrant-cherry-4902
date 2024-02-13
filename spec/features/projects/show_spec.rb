require "rails_helper"

RSpec.describe "Projects Show Page", type: :feature do
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

    visit show_projects_path(@lit_fit)
  end
  describe "User Story 1" do
    it "displays the project name and material, along with the theme" do
      expect(page).to have_content("Project Name: Litfit")
      expect(page).to have_content("Material: Lamp Shade")
      expect(page).to have_content("Challenge Theme: Apartment Furnishings")
    end
  end

  describe "User Story 3" do
    it "displays the count of number of contestants" do
      expect(page).to have_content("Number of Contestants: 2")
    end
  end
end
