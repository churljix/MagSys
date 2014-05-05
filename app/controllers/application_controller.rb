class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :confirm_logged_in

private

  def confirm_logged_in
  	unless session[:user_id]
  		flash[:notice]= "Please log in"
  		redirect_to(:controller => 'access', :action => 'login')
  		return false
  	else
  		return true
  	end	
  end

  def system_user
    unless session[:user_id]
      return true
    else
      flash[:notice]= "Already logged in"
      redirect_to(magazines_path)
      return true
    end 
  end

  def user_role
    if session[:user_id]
      #@user_roles = User_roles.find(session[:user_id])
      # if @user.admin?
      #   session[:admin] = true
      # elsif @user.editor?
      #   session[:editor] = true
      # elsif @user.accountant?
      #   session[:accountant] = true
      # else
      #   session[:agent] = true
      # end      
    end
  end
end
