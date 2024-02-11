require "rails_helper"

RSpec.describe Project, type: :model do

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "#contestant_count" do
    it 'calculates the count of all contestants' do
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      # lit_fit.contestants << [jay, gretchen, kentaro]

      jay.projects << lit_fit
      gretchen.projects << lit_fit
      kentaro.projects << lit_fit

      expect(lit_fit.contestant_count).to eq(3)
    end
  end

  describe '#contestant_avg_experience' do
    it 'calculates contestants average experience' do
      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

      jay = Contestant.create(name: "Jay McCarroll", age: 40, hometown: "LA", years_of_experience: 13)
      gretchen = Contestant.create(name: "Gretchen Jones", age: 36, hometown: "NYC", years_of_experience: 12)
      kentaro = Contestant.create(name: "Kentaro Kameyama", age: 30, hometown: "Boston", years_of_experience: 8)

      # lit_fit.contestants << [jay, gretchen, kentaro]

      jay.projects << lit_fit
      gretchen.projects << lit_fit
      kentaro.projects << lit_fit

      expect(lit_fit.contestant_avg_experience).to eq(11)
    end
  end
end
