class Project < ApplicationRecord
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestants_avg_xp
    total_experience = contestants.sum(:years_of_experience)
    total_contestants = contestants.count.to_f

    return 0 if total_contestants == 0
    
    total_experience / total_contestants
  end
end
