require 'rails_helper'

RSpec.describe '#Projects Show Page', type: :feature do
 describe 'As a visitor' do
  before(:each) do
    @recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    @furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

    @news_chic = @recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    @boardfit = @recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")

    @upholstery_tux = @furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    @lit_fit = @furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    @jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    @gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    @kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    @erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    ContestantProject.create(contestant_id: @jay.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @news_chic.id)
    ContestantProject.create(contestant_id: @gretchen.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @upholstery_tux.id)
    ContestantProject.create(contestant_id: @kentaro.id, project_id: @boardfit.id)
    ContestantProject.create(contestant_id: @erin.id, project_id: @boardfit.id)
  end
  #User Story #1
  it 'displays the projects information' do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content(@news_chic.name)
    expect(page).to have_content(@news_chic.material)
    
    expect(page).to have_content(@recycled_material_challenge.theme)
  end

  #User Story 3
  it "displays number of contestants on this project" do
    visit "/projects/#{@news_chic.id}"

    expect(page).to have_content("Number of Contestants: 2")
  end

  #User Story Extension 1 - Average years of experience for contestants by project
  it "displays number of contestants on this project" do
    visit "/projects/#{@boardfit.id}"

    expect(page).to have_content("Average Contestant Experience: 11.5 years")
  end

  #User Story Extension 2 - Adding a contestant to a project
  it "displays a form to add a contestant to this project" do
    # When I visit a project's show page
    visit "/projects/#{@boardfit.id}"

    # I see a form to add a contestant to this project
    expect(page).to have_content("Add a Contestant")
    expect(page).to have_content("Number of Contestants: 2")

    # When I fill out a field with an existing contestants id
    fill_in(:add_contestant, with: "#{@jay.id}")

    # And hit "Add Contestant To Project"
    click_button("Add Contestant To Project")
    
    # I'm taken back to the project's show page
    expect(current_path).to eq("/projects/#{@boardfit.id}")

    # And I see that the number of contestants has increased by 1
    expect(page).to have_content("Number of Contestants: 3")
    # And when I visit the contestants index page
    visit "/contestants"
    
    # I see that project listed under that contestant's name
    within "#contestant-#{@jay.id}" do
      expect(page).to have_content("Boardfit")
    end
  end

 end
end