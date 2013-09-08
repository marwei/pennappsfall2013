class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email
  has_many :user_skills
  has_many :skills, through: :user_skills
  # accepts_nested_attributes_for :skills

  has_many :project_skill_users
  has_many :memberships, through: :project_skill_users, foreign_key: "user_id", class_name: "Project"
  has_many :ownerships, foreign_key: "owner_id", class_name: "Project"

  has_many :notifications
  
  def add_user_skills_to_project(options = {})
    return unless options['project_id']
    common_skills = Project.find(options['project_id']).skills.collect(&:id) & self.skills.collect(&:id)
    common_skills.each do |s|
      psu = ProjectSkillUser.new(project_id: options['project_id'], skill_id: s, user_id: self.id)
      psu.save if psu.valid?
    end
    message_subject = "Another hacker would like to join your project!"
    message_body = "Hello " + User.find(Project.find(options['project_id']).owner_id).nickname + ", " + self.nickname + " has joined " + Project.find(options['project_id']).name + ". " + self.nickname + " is familiar with " + Skill.find_all_by_id(common_skills).collect(&:name).join(",")
    note = Notification.new(user_id: User.find(Project.find(options['project_id']).owner_id), message_subject: message_subject, message_body: message_body)
    note.save if note.valid?
  end

end
