require "rails_helper"

RSpec.describe Project, type: :model do

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "instance methods" do
    let!(:challenge_1) {Challenge.create!(theme: "Apartment Furnishings", project_budget: 550)}
    let!(:project_1) {challenge_1.create!(name: "Litfit", material: "Lamp Shade")}

    it "list challenge's theme" do
      expect(project_1.challenge_theme).to eq("Apartment Furnishings")
    end
  end
end
