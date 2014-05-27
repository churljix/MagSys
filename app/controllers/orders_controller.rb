class OrdersController < ApplicationController
  before_action :confirm_logged_in
  #before_action :is_power_login, except: [:index, :create]
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  #before_action :user_object, only: [:show, :edit, :update, :destroy]
  
  before_action :set_issues
  before_action :set_clients

  # GET /orders
  # GET /orders.json
  def index
    if is_power
      if params[:contract_id].nil?
        @orders = Order.where(status: 'S').paginate(:page => params[:page], :per_page => 10)
      else
        @orders = Order.where(:contract_id => params[:contract_id]).paginate(:page => params[:page], :per_page => 10)
      end
    else
      if params[:contract_id].nil?
        if params[:status].nil?
          @orders = Order.where( :status => 'P', :user_id => session[:user_id]).paginate(:page => params[:page], :per_page => 10).where.not(:status => ['D'])
        else
          @orders = Order.where( :status => params[:status], :user_id => session[:user_id]).paginate(:page => params[:page], :per_page => 10).where.not(:status => ['D'])
        end
      else
        @orders = Order.where(:contract_id => params[:contract_id]).paginate(:page => params[:page], :per_page => 10)
      end
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new(order_params)
  end


  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    session[:return_to] ||= request.referer
    respond_to do |format|
      if @order.save!
        if is_power
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render action: 'show', status: :created, location: @order }
        else
          format.html { redirect_to session.delete(:return_to), notice: 'Order was successfully added.' }
          format.json { render action: 'index', status: :created, location: @order }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /orders/1/edit
  def edit
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path(:status => 'P'), notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.update_attribute(:status, 'D')
    respond_to do |format|
      format.html { redirect_to orders_url , notice: 'Order was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:issue_id, :field_id, :client_id, :user_id, :contract_id, :title, :notes, :total_amount, :special, :status)
    end

  def user_object
    if is_power
      return true
    else
      if @order.user_id == session[:user_id]
        return true
      else
        flash[:notice]= "No premission to view this content"  
        redirect_to(orders_path(:status => 'A'))      
        return false
      end
    end
  end
end
