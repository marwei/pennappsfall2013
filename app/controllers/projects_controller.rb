class ProjectsController < ApplicationController
  def new
    @project = current_user.ownerships.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    respond_to do |format|
      format.html
      format.js
    end

    @project = current_user.ownerships.build(app_params)

    if @project.save
      respond_to do |format|
        format.html { 
          flash[:success] = "project Created!!"  #should have insertion
          redirect_to root_url
        }
        format.js
      end
    else
      respond_to do |format|
        format.html { 
          render 'new'
        }
        format.js   
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def app_params
    params.require(:project).permit(:title, :description, :active, :updated_at, :created_at)
  end
end
