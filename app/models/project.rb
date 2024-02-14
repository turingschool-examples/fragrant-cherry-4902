class Project < ApplicationRecord
  belongs_to :challenge
  has_many :contestant_projects, dependent: :destroy
  has_many :contestants, through: :contestant_projects

  def num_contestants
    contestants.count
  end
end
