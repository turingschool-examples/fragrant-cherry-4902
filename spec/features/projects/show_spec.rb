require "rails_helper"

RSpec.describe "Project Show Page", type: :feature do
  before :each do
    @challenge_1 = Challenge.create!(theme: "Recycled Material", project_budget: 1000)

    @project_1 = @challenge_1.projects.create!(name: "News Chic", material: "Newspaper")
  end

  it "displays project's name, material, and theme of the challenge when visiting project show page" do
    visit "/projects/#{@project_1.id}"

    expect(page).to have_content("Project Name: #{@project_1.name}")
    expect(page).to have_content("Material: #{@project_1.material}")
    expect(page).to have_content("Challenge Theme: #{@challenge_1.theme}")
  end
end