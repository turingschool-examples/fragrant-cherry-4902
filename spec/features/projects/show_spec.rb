require 'rails_helper'

RSpec.describe "Projects show page" do
    it 'shows the projects, material, and theme' do
        # (e.g. name: Litfit, Material: Lamp Shade, Challenge Theme: Apartment Furnishings)
        @challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        @project = @challenge.projects.create(name: "Litfit", material: "Lamp")
        # When I visit a project's show page ("/projects/:id"),
        visit "/projects/#{@project.id}"
        # I see that project's name and material
        expect(page).to have_content("Project Name: #{@project.name}")
        expect(page).to have_content("Material: #{@project.material}")
    end
    
    it 'should show the theme of the project when visiting show page' do
        @challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        @project = @challenge.projects.create(name: "Litfit", material: "Lamp")
        
        visit "/projects/#{@project.id}"
        
        # And I also see the theme of the challenge that this project belongs to.
        expect(page).to have_content("Challenge Theme: #{@challenge.theme}")
    end

    # As a visitor,
    # When I visit a project's show page
    # I see a count of the number of contestants on this project
    # number of contestants - 3
    it 'should show a count of the number of contestants on the project' do
        @challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
        @project = @challenge.projects.create(name: "Litfit", material: "Lamp")
        @nico = Contestant.create!(name: "Nico", age: 39, hometown: "Florida", years_of_experience: 1)
        @jenna = Contestant.create!(name: "Jenna", age: 37, hometown: "Miami", years_of_experience: 3)
        
        #join projects and contestants
        # Nico - project 1 and 2
        # Jenna - project 1 and 3
        # count of contestants -2
        ContestantProject.create!(contestant_id: @nico.id, project_id: @project.id)
        ContestantProject.create!(contestant_id: @jenna.id, project_id: @project.id)

        visit "/projects/#{@project.id}"

        expect(page).to have_content("Number of Contestants: 2")
    end
end