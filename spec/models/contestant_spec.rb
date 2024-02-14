require "rails_helper"

RSpec.describe Contestant, type: :model do

  describe "relationships" do
    it {should have_many :contestant_projects}
    it {should have_many(:projects).through(:contestant_projects)}
  end

end