class Users::SessionsController < Devise::SessionsController
  def new
  	@user = User.new
    respond_to do |format|
    	format.html { super }
    	format.js
    end      	
  end

  def create
    super
    current_user.save
  end

	protected

  def after_sign_in_path_for(user)
  	root_path
  end
end