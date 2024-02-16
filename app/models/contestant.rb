class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects

  def contestant_project_names
    self.projects.pluck(:name)
  end
end
