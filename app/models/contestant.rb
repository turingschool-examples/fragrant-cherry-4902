class Contestant < ApplicationRecord
  has_many :contestant_projects
  has_many :projects, through: :contestant_projects


  def return_projects
    projects.pluck(:name).join(", ")
  end
end
