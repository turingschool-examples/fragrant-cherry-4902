class Project < ApplicationRecord
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    contestants.count
  end

  def average_contestants_experience
    total_experience = contestants.sum(:years_of_experience)
    total_experience.to_f/contestant_count
  end
end
