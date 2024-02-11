require "rails_helper"

RSpec.describe Project, type: :model do

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  describe "Instance Methods" do
    describe '#project_challenge_theme' do
      it 'returns the theme of the challenge' do
        recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)

        news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")

        expect(news_chic.project_challenge_theme).to eq(recycled_material_challenge.theme)
      end
    end
  end 
end
