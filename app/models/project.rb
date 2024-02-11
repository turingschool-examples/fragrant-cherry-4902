class Project < ApplicationRecord
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def project_challenge_theme
    Challenge.find(self.challenge_id).theme
  end

  def contestant_count
    Contestant.joins(:projects).where("projects.id = #{self.id}").count
  end

  def average_contestant_experience
    Contestant.joins(:projects).where("projects.id = #{self.id}").average("contestants.years_of_experience").round(1)
  end
end
