class ProjectSkill < ActiveRecord::Base

  belongs_to :projects
  belongs_to :skill

end
