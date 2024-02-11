require 'rails_helper'

RSpec.describe 'Project show page' do
    describe 'User story 1' do
        it 'displays project name and material and the challenge it belongs to' do
            furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

            lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

            # User Story 1 of 3

            # As a visitor,
            # When I visit a project's show page ("/projects/:id"),
            visit "/projects/#{lit_fit.id}"
            # I see that project's name and material
            expect(page).to have_content("Litfit")
            expect(page).to have_content("Lamp")
            # And I also see the theme of the challenge that this project belongs to.
            expect(page).to have_content("Apartment Furnishings")
            # (e.g.    Litfit
            #     Material: Lamp Shade
            # Challenge Theme: Apartment Furnishings)
        end
    end

    describe 'User story 3' do
        it 'displays the number of contestants' do
            furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

            lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

            jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
            gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
            kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

            jay.projects << lit_fit
            gretchen.projects << lit_fit
            kentaro.projects << lit_fit
            # User Story 3 of 3
            # As a visitor,
            # When I visit a project's show page
            visit "/projects/#{lit_fit.id}"
            # I see a count of the number of contestants on this project
            expect(page).to have_content(3)

            # (e.g.    Litfit
            #     Material: Lamp Shade
            # Challenge Theme: Apartment Furnishings
            # Number of Contestants: 3 )
        end
    end

    describe 'User story extension 1' do
        it 'displays the average years of experience of contestants' do
            furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

            lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

            jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
            gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
            kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

            jay.projects << lit_fit
            gretchen.projects << lit_fit
            kentaro.projects << lit_fit
            # User Story Extension 1 - Average years of experience for contestants by project

            # As a visitor,
            # When I visit a project's show page
            visit "/projects/#{lit_fit.id}"
            # I see the average years of experience for the contestants that worked on that project
            expect(page).to have_content(11)
            # (e.g.    Litfit
            #     Material: Lamp Shade
            # Challenge Theme: Apartment Furnishings
            # Number of Contestants: 3
            # Average Contestant Experience: 10.25 years)
        end
    end
end