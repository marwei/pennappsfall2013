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
end
