class ProjectSkillUser < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :skill
  belongs_to :user

end
