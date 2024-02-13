class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def names_of_projects
    self.projects.pluck(:name)
  end
end
