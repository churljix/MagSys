class MainController < ApplicationController
  def index
  	@magazines = Magazine.all.paginate(:page => params[:page], :per_page => 10)
  end
end
