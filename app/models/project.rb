class Project < ApplicationRecord
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def project_challenge_theme
    Challenge.find(self.challenge_id).theme
  end

  
end
