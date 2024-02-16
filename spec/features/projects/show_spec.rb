require "rails_helper"

RSpec.describe "Project Show Page", type: :feature do
  before :each do
    @challenge_1 = Challenge.create!(theme: "Recycled Material", project_budget: 1000)

    @project_1 = @challenge_1.projects.create!(name: "News Chic", material: "Newspaper")
  end

  #User Story - 1
  it "displays project's name, material, and theme of the challenge when visiting project show page" do
    visit "/projects/#{@project_1.id}"

    expect(page).to have_content("Project Name: #{@project_1.name}")
    expect(page).to have_content("Material: #{@project_1.material}")
    expect(page).to have_content("Challenge Theme: #{@challenge_1.theme}")
  end

  #User Story - 3
  before :each do

    @challenge_1 = Challenge.create!(theme: "Recycled Material", project_budget: 1000)

    @project_1 = @challenge_1.projects.create!(name: "News Chic", material: "Newspaper")
    @project_2 = @challenge_1.projects.create!(name: "Boardfit", material: "Cardboard Boxes")
    @project_3 = @challenge_1.projects.create!(name: "Vintage Chic", material: "Denim")

    @contestant_1 = Contestant.create!(name: "Yves Saint Laurent", age: 71, hometown: "Paris", years_of_experience: 58)
    @contestant_2 = Contestant.create!(name: "Coco Chanel", age: 87, hometown: "Saumur", years_of_experience: 73)
    @contestant_3 = Contestant.create!(name: "Kanye West", age: 46, hometown: "Atlanta", years_of_experience: 13)

    ContestantProject.create!(contestant_id: @contestant_1.id, project_id: @project_1.id)
    ContestantProject.create!(contestant_id: @contestant_1.id, project_id: @project_2.id)  
    ContestantProject.create!(contestant_id: @contestant_2.id, project_id: @project_1.id)
    ContestantProject.create!(contestant_id: @contestant_2.id, project_id: @project_3.id)
    ContestantProject.create!(contestant_id: @contestant_3.id, project_id: @project_1.id)
    ContestantProject.create!(contestant_id: @contestant_3.id, project_id: @project_2.id) 
    ContestantProject.create!(contestant_id: @contestant_3.id, project_id: @project_3.id) 

  end

  it "displays the number of contestants working on each respective project" do
    visit "/projects/#{@project_1.id}"
    expect(page).to have_content("Number of Contestants: 3")

    visit "/projects/#{@project_2.id}"
    expect(page).to have_content("Number of Contestants: 2")

    visit "/projects/#{@project_3.id}"
    expect(page).to have_content("Number of Contestants: 2")
  end
end