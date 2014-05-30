class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :confirm_logged_in
  helper_method :is_power, :nil_zero
  before_action :login_user
  before_action :unread_messages
  before_action :unpaid_invoices

private

  def confirm_logged_in
  	unless session[:user_id]
  		flash[:notice]= "Please log in or sign up"
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
    end
  end

  def is_power_login
    if session[:user_id]
      @user_roles = User.find(session[:user_id])
      if @user_roles.admin? or @user_roles.editor?
        return true
      else
        flash[:notice]= "No premission to view this content"
        redirect_to(magazines_path)
        return false
      end
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

  def login_user
    unless session[:user_id]
      return @user_login
    else
      @user_login = User.find(session[:user_id])
      return @user_login
    end 
  end

  def unread_messages
    if session[:user_id]
      @un_messages = Message.where(:status => 'S').where(:recipient_id => session[:user_id]).where(:visible => true).count
      return @un_messages
    end
  end

  def unpaid_invoices
    if session[:user_id]
      @user = User.find(session[:user_id])
      @user_contracts = Contract.where(:agency_id => @user.agency_id, :status => 'Y')
      @un_invoices = Invoice.where(:status => ['S','P']).where(:contract_id => @user_contracts ).count 
      return @un_invoices
    end
  end

  def set_agencies
      @agencies = Agency.where(:status => 'Y')
    end

    def set_users
      @users = User.where(:status => 'Y')
    end
  def set_orders
      @orders = Order.where(:contract_id => nil).where(status: 'A')
  end
  def set_clients
      @clients = Client.where(:status => 'Y')
  end
  def set_contracts
      @contracts = Contract.where(:status => 'Y')
  end
  def set_fields
      @fields = Field.where(:status => 'Y')
  end
  def set_invoices
      @invoices = Invoice.where(:status => 'Y')
  end
  def set_magazines
      @magazines = Magazine.where(:status => 'Y')
  end 
  def set_issues
      @issues = Issue.where(:status => 'Y')
  end 
  # def set_messages
  #     @messages = Message.where(:status => 'Y')
  # end 
  def set_payments
      @payments = Payment.where(:status => 'Y')
  end 
end
