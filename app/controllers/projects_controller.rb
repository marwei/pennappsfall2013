class ProjectsController < ApplicationController
  def new
    @project = current_user.ownerships.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
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
    @project = current_user.ownerships.find_by_id(params[:id])
  end

  def update
    @project = current_user.ownerships.find_by_id(params[:id])
    if @project.update_attributes(app_params)
      respond_to do |format|
        format.html {
          flash[:success] = "Project Updated!"
          redirect_to root_url
        }
        format.js
      end
    else
      respond_to do |format|
        format.html {
          flash[:error] = "Update Unsuccessful :("
          render 'edit'
        }
        format.js
      end
    end
  end

  def show
    @project = Project.find_by_id(params[:id])
  end

  def destroy
    @project = current_user.ownerships.find_by_id(params[:id])
    @project.destroy
    redirect_to root_url
  end

  private
  
  def app_params
    params.require(:project).permit(:name, :description, :size, :active, :updated_at, :created_at)
  end
end
