class Project < ActiveRecord::Base
	has_many :skills

	has_many :project_skills
	
  has_many :users, through: :project_skill_users
end
