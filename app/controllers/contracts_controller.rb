class ContractsController < ApplicationController
  before_action :confirm_logged_in 
  before_action :is_power_login, except: [:index] #if has role admin
  before_action :set_contract, only: [:show, :edit, :update, :destroy]   
  before_action :set_agencies
  before_action :set_orders

#helpers for using in view
  helper_method :c_remaining
  helper_method :c_total
  # GET /contracts
  # GET /contracts.json
  def index
    if is_power #display different data for different roles
      @contracts = Contract.where( :status => 'Y').paginate(:page => params[:page], :per_page => 10)
    else
      @user = User.find(session[:user_id])
      @contracts = Contract.where(:agency_id => @user.agency_id, :status => 'Y').paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  def add #for adding order to contract by admin
    Order.where(:id => params[:orders_id]).update_all(:contract_id => params[:con_pk])
    redirect_to contracts_url
  end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contract }
      else
        format.html { render action: 'new' }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.update_attribute(:status, 'N')
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Allowed parameters to update
    def contract_params
      params.require(:contract).permit(:agency_id, :date, :discount, :notes, :user_id, :status)
    end

    def c_total(c_id) #get the total amount for contract
      @orders = Order.where(:contract_id => c_id)
      @c_total = @orders.sum(:total_amount)
      return @c_total
    end

    def c_remaining(c_id) # get the remaining amount for contract by adding all payments for contract invoices.
     @invoices = Invoice.where(:contract_id => c_id)
     @payments = Payment.where(:invoice_id => @invoices)
     @remaining = @payments.sum(:amount)
     @c_remaining = @c_total - @remaining
     return @c_remaining
    end
end
