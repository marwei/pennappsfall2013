class UsersController < ApplicationController
	def new
	end

	def create
		
	end

	def edit
		@user = current_user
		@userskills = current_user.skills.all
		@allskills = Skill.all - @userskills
	end

	def update
		@user = current_user
		params['user']['skills']['name'].split(", ").each do |skill|
			us = UserSkill.new(user_id: current_user.id, skill_id: Skill.find_by_name(skill).id)
			us.save if us.valid?
		end

		if @user.update_attributes(app_params)
			flash[:success] = "Profile Updated!"
			redirect_to current_user
		else
			render edit_user_path
		end
	end

	def update_skills
		@skills = current_user.build(params[:name])
		
	end

	def destroy
		
	end

	def index
		
	end

	#user github
	def github
		
	end

	#user profile
	def show

	end

private
  def app_params
    params.require(:user).permit(:school, :year, :major, :self_description, skills_attributes: :name)
  end

end