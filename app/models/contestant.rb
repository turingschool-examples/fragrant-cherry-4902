class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def find_contestant_projects
    Project.joins(:contestants).where("contestants.id = #{self.id}")
  end
end
