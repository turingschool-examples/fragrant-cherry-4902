class Project < ApplicationRecord
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def num_of_contestants
    contestants.count
  end

  def avg_experience_of_contestants
    contestants.average(:years_of_experience)
  end
end
