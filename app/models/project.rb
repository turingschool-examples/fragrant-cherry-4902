class Project < ApplicationRecord
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def number_of_contestants
    self.contestants.count
  end

  def avg_experience
    self.contestants.average(:years_of_experience)
  end
end
