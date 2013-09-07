class Skill < ActiveRecord::Base
	has_many :user_skills
	has_many :users, through: :user_skills


#### make this relation later
	# has_many :project_skill_users
 #  has_many :projects, through: :project_skill_users
end
