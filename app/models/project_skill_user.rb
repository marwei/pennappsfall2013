class ProjectSkillUser < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :skill
  belongs_to :user

  after_create :check_project_status

  def check_project_status
    #do i have a set of people who satisfy the number of people required for the project who also cover the entire set of skills required for a project
    return false unless ProjectSkillUser.find_by_project_id(self.project_id).collect(&:user_id).uniq.count >= Project.find(self.project_id).user_capacity
    return false unless (Project.find(self.project_id).skills.collect(&:id) - ProjectSkillUser.find_by_project_id(self.project_id).collect(&:skill_id)).count == 0
    return true
  end

end
