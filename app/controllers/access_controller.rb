class AccessController < ApplicationController
	before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  before_action :system_user, :only => [:login,:attempt_login]
  def index
  	#dispaly text
  end

  def login
  	#login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = "You are now logged in."
      if authorized_user.admin?
        redirect_to(:action => 'index')
      else
        redirect_to main_index_path
      end
    else
      flash[:notice] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "Logged out"
    redirect_to(:action => "login")
  end

  # def registration
  #   #registartion form
  # end

  # def attempt_registration
  #   #if params[:username].present? && params[:password].present?
  #   if params[:password] = params[:password1] 
  #     redirect_to(:action => 'registration')
  #   else
  #     redirect_to(:action => 'login')
  #   end
  # end
end
