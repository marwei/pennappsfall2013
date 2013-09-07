class UserSkillsController < ApplicationController
	def new
		@user_skill = current_user.user_skills.build
	end

	def create
		@skill = Skill.find_by_name(params[:skill_name])
		@user_skill = current_user.user_skills.build(skill_id: @skill.id)
		if @user_skill.save
			flash[:success] = "Success!!"
			redirect_to root_url
		else
			flash[:error] = "Failed!!"
		end
	end

	private
	def app_params
    params.require(:user_skill).permit(:user_id, :skill_id, :rating, :updated_at, :created_at)
  end
end
