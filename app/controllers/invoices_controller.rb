class InvoicesController < ApplicationController
  before_action :confirm_logged_in
  before_action :is_power_login, except: [:index, :show]
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  
  # GET /invoices
  # GET /invoices.json
  def index
    if is_power
      @invoices = Invoice.where.not(:status => 'D').paginate(:page => params[:page], :per_page => 10)
    else
      @user = User.find(session[:user_id])
      @contracts = Contract.where(:agency_id => @user.agency_id, :status => 'Y')
      @invoices = Invoice.where.not(:status => 'D').paginate(:page => params[:page], :per_page => 10).find_all_by_contract_id(@contracts)
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.remaining = @invoice.total

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.update_attribute(:status, 'D')
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:total, :remaining, :date, :due_date, :contract_id, :note, :status)
    end
end
