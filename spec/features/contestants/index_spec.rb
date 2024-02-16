require "rails_helper"

RSpec.describe "Contestant's Index Page", type: :feature do
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

  it "should display a list of names of all the contestants trying to Make it Work!" do
    visit "/contestants"

    expect(page).to have_content("Make it Work! Contestants List:")
    expect(page).to have_content(@contestant_1.name)
    expect(page).to have_content(@contestant_2.name)
    expect(page).to have_content(@contestant_3.name)
  end

  it "should list all respective projects each contestant has been on underneath" do
    visit "/contestants"

    within "#contestant-#{@contestant_1.id}" do
      expect(page).to have_content(@project_1.name)
      expect(page).to have_content(@project_3.name)
      expect(page).to_not have_content(@project_2.name)
    end

    within "#contestant-#{@contestant_2.id}" do
      expect(page).to have_content(@project_1.name)
      expect(page).to have_content(@project_2.name)
      expect(page).to_not have_content(@project_3.name)
    end

    within "#contestant-#{@contestant_3.id}" do
      expect(page).to have_content(@project_1.name)
      expect(page).to have_content(@project_2.name)
      expect(page).to have_content(@project_3.name)
    end
  end
end