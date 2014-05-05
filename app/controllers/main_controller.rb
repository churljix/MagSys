class MainController < ApplicationController
  def index
  	@magazines = Magazine.all
  end
end
