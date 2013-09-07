class WelcomeController < ApplicationController
  def index
  	if signed_in?
    else
      render 'landing', layout: false
    end
  end
end
