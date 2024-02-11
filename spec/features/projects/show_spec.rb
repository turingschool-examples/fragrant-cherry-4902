require 'rails_helper'

RSpec.describe 'Projects Show Page' do
  before(:each) do
    @jay = Contestant.create!(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create!(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @erin = Contestant.create!(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)
    @doug = Contestant.create!(name: "Doug Robertson", age: 44, hometown: "Denver", years_of_experience: 9)
    @dave = Contestant.create!(name: "Dave Robertson", age: 44, hometown: "Denver", years_of_experience: 17)

    @recycled_material_challenge = Challenge.create!(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create!(name: "News Chic", material: "Newspaper")
    @upholstery_tux = @furniture_challenge.projects.create!(name: "Upholstery Tuxedo", material: "Couch")

    ContestantProject.create!(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create!(contestant_id: @erin.id, project_id: @news_chic.id)
    ContestantProject.create!(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create!(contestant_id: @doug.id, project_id: @upholstery_tux.id)
    ContestantProject.create!(contestant_id: @dave.id, project_id: @upholstery_tux.id)
  end

  it 'can visit a projects show page and see the projects name and material' do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content(@news_chic.material)
  end

  it 'also shows the theme of the challenge that the project is associated with' do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(@recycled_material_challenge.theme)
  end

  it 'can visit a projects show page and see the number of contestants on the project' do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Number of Contestants: 2")
    
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Number of Contestants: 3")
  end

  it 'shows the average years of experience for the contestants on a project' do    
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Average Contestant Experience: 14.0")
    
    visit "/projects/#{@upholstery_tux.id}"

    expect(page).to have_content("Average Contestant Experience: 12.7")
  end
end