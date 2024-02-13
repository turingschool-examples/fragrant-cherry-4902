require "rails_helper"

RSpec.describe "project" , type: :feature do
    before(:each) do 
        @challenge = Challenge.create!(theme: "Apartment Furnishings", project_budget: 9000)
        @project = @challenge.projects.create!(name: "Litfit", material: "Lamp Shade")
        
        @contestant1 = Contestant.create!(name: "Kentaro Kameyama", age: 30, hometown: "Tokyo")
        @contestant2 = Contestant.create!(name: "Jay McCarroll", age: 35, hometown: "LA")
        @contestant3 = Contestant.create!(name: "Mondo Guerra", age: 32, hometown: "Denver")
        @project.contestants << [@contestant1, @contestant2, @contestant3]
    end

    # User story 1 As a visitor,
    it 'displays project name and material and the theme of the challenges' do 

        # When I visit a project's show page ("/projects/:id"),
        visit "/projects/#{@project.id}"

        # I see that project's name and material
        expect(page).to have_content("Litfit")
        expect(page).to have_content("Lamp Shade")

        # And I also see the theme of the challenge that this project belongs to.
        expect(page).to have_content("Apartment Furnishings")
    end

    # User story 3 As a visitor,
    it 'shows the count of the number of contestants on this project' do
        # When I visit a project's show page
        visit "/projects/#{@project.id}"

        # I see a count of the number of contestants on this project
        expect(page).to have_content("Number of Contestants: 3")
    end
end
   