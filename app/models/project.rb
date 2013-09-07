class Project < ActiveRecord::Base

  has_many :project_skills
  has_many :skills, through: :project_skills
  has_many :project_skill_users
  has_many :users, through: :project_skill_users, foreign_key: "user_id", class_name: "User"

end
