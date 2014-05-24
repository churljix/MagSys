class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :confirm_logged_in
  helper_method :is_power, :nil_zero
  before_action :login_user
  before_action :unread_messages

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

  def login_user
    unless session[:user_id]
      return @user_login
    else
      @user_login = User.find(session[:user_id])
      return @user_login
    end 
  end

  def unread_messages
    @un_messages = Message.where(:status => 'S').paginate(:page => params[:page], :per_page => 10).where(:recipient_id => session[:user_id]).where(:visible => true).count
    return @un_messages
  end


  def set_agencies
      @agencies = Agency.where(:status => 'Y')
    end

    def set_users
      @users = User.where(:status => 'Y')
    end
  def set_orders
      @orders = Order.where(:contract_id => nil).where.not(status: 'D')
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
