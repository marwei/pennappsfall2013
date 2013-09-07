class WelcomeController < ApplicationController
    def index
  	if signed_in?
      
    else
      render 'landing', layout: false
      # # this part renders show good list
      # if params[:commit].nil? || params[:commit] == 'goods'
      #   @search = Good.search do
      #     fulltext params[:search]
      #     if params[:search].nil? || params[:search].empty?
      #       with :owner_id, params[:id].to_i
      #     end
      #     paginate page: params[:page], per_page: 10
      #   end
      #   @goods = @search.results
      # end
      # # show good list ends
	  end
  end
end
