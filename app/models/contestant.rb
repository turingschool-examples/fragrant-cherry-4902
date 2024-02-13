class Contestant < ApplicationRecord
  has_many :contestant_projects, dependent: :destroy
  has_many :projects, through: :contestant_projects
end
