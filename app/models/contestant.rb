class Contestant < ApplicationRecord
  has_many :contestant_projects, dependent: :destroy
  has_many :projects, through: :contestant_projects

  def self.contestant_count
    self.count
  end

  def self.average_exp
    self.average(:years_of_experience)
  end
end
