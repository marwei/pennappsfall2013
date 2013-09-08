class ProjectSkillUser < ActiveRecord::Base
  
  belongs_to :project
  belongs_to :skill
  belongs_to :user

  after_create :check_project_status

  def check_project_status
    #do i have a set of people who satisfy the number of people required for the project who also cover the entire set of skills required for a project
    return unless ProjectSkillUser.find_by_project_id(self.project_id).collect(&:user_id).uniq.count >= Project.find(self.project_id).user_capacity
    return unless !(Project.find(self.project_id).skills.collect(&:id) - ProjectSkillUser.find_by_project_id(self.project_id).collect(&:skill_id)).any?
    full_project = Project.find(self.project_id)
    full_project.is_full = 1
    full_project.save if full_project.valid?
    message_subject = "Your project has been filled!"
    message_body = "Hello " + User.find(Project.find(self.project_id).owner_id).nickname + ", " + User.find_all_by_id(ProjectSkillUser.find_by_project_id(self.project_id).collect(&:user_id)).nickname.join(",")
    note = Notification.new(user_id: User.find(Project.find(self.project_id).owner_id), message_subject: message_subject, message_body: message_body)
    note.save if note.valid?
  end

end
