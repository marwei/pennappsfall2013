class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_skills
  has_many :skills, through: :user_skills
  # accepts_nested_attributes_for :skills


  has_many :project_skill_users
  has_many :memberships, through: :project_skill_users, foreign_key: "user_id", class_name: "Project"
  has_many :ownerships, foreign_key: "owner_id", class_name: "Project"

end
