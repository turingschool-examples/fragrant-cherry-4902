require 'rails_helper'

RSpec.describe 'Contestants Index Page' do
  it 'can show a list of names of all contestants' do
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    visit "/contestants"

    expect(page).to have_content(jay.name)
    expect(page).to have_content(gretchen.name)
    expect(page).to have_content(kentaro.name)
    expect(page).to have_content(erin.name)
  end

  it 'shows the projects that each contestant has been on' do
    jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
    gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
    kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)
    erin = Contestant.create(name: "Erin Robertson", age: 44, hometown: "Denver", years_of_experience: 15)

    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    boardfit = recycled_material_challenge.projects.create(name: "Boardfit", material: "Cardboard Boxes")
    upholstery_tux = furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    ContestantProject.create(contestant_id: jay.id, project_id: news_chic.id)
    ContestantProject.create(contestant_id: gretchen.id, project_id: upholstery_tux.id)
    ContestantProject.create(contestant_id: kentaro.id, project_id: boardfit.id)
    ContestantProject.create(contestant_id: erin.id, project_id: lit_fit.id)


    visit "/contestants"

    expect(page).to have_content(news_chic.name)
    expect(news_chic.name).to appear_before(upholstery_tux.name)
    expect(page).to have_content(boardfit.name)
    expect(upholstery_tux.name).to appear_before(boardfit.name)
    expect(page).to have_content(upholstery_tux.name)
    expect(boardfit.name).to appear_before(lit_fit.name)
    expect(page).to have_content(lit_fit.name)
  end
end


