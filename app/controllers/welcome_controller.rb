class WelcomeController < ApplicationController
  def index
  	if signed_in?
  		@projects = Project.all
    else
      render 'landing', layout: false
    end
  end
end
