class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :confirm_logged_in
  helper_method :is_power, :nil_zero

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

  def is_power
    if session[:user_id]
      @user_roles = User.find(session[:user_id])
      if @user_roles.admin? or @user_roles.editor?
        return true
      else
        return false
      end
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

  def is_power_user
    if session[:user_id]
      @user_roles = User.find(session[:user_id])
      if @user_roles.admin? or @user_roles.editor?
        return true
      else
        redirect_to(user_path(:id => session[:user_id]))
        return false
      end
    end
  end


  def set_agencies
      @agencies = Agency.all
    end

    def set_users
      @users = User.all
    end
  def set_orders
      @orders = Order.where(:contract_id => nil)
  end  
end
