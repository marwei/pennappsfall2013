class Users::RegistrationsController < Devise::RegistrationsController
  def new
  	
    respond_to do |format|
    	format.html { super }
    	format.js
    end    
  end

  def create
    super
  end

  def edit
  end

  def update
    if current_user.update_attributes(app_params)
      redirect_to current_user
    else
      render edit_user_registration_path
    end
  end

private
  def app_params
    params.require(:user).permit(:nickname, :firstname, :lastname, :email, :encrypted_password, :updated_at, :created_at, skills_attributes: :name)
  end
end
