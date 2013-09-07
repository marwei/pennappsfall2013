class Skill < ActiveRecord::Base

  validates_uniqueness_of :name
  has_many :user_skills
  has_many :users, through: :user_skills
  has_many :project_skills
  has_many :projects, through: :project_skills

end
