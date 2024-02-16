require "rails_helper"

RSpec.describe "Project Show Page" do
  before :each do
    @project_1 = challenge_1.projects.create!(name: "News Chic", material: "Newspaper")
    @project_2 = challenge_1.projects.create!(name: "Boardfit", material: "Cardboard Boxes")
    
    @challenge_1 = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @challenge_2 = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)
  end

  it "displays project's name, material, and theme of the challenge when visiting project show page" do
    visit "/projects/#{project_1.id}"

    expect(page).to have_content(@project_1.name)
    expect(page).to have_content(@project_1.material)
    expect(page).to have_content(@challenge_1.theme)
  end
end