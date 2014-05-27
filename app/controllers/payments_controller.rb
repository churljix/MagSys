class PaymentsController < ApplicationController
  before_action :confirm_logged_in
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_action :is_power_user, except: [:show, :new, :create]
  
  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.where(:status => 'Y').paginate(:page => params[:page], :per_page => 10)
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    @invoice = Invoice.find(@payment.invoice_id)
    params[:invoice_id] = @invoice.id
      respond_to do |format|
          if @payment.save            
            if @payment.amount >= @invoice.remaining 
              @invoice.status = 'A'
              @invoice.remaining = 0
            else
              @invoice.status = 'P'
              @invoice.remaining = @invoice.remaining - @payment.amount
            end
            @invoice.save
            format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
            format.json { render action: 'show', status: :created, location: @payment }
          else
            format.html { render action: 'new', :invoice_id => params[:invoice_id]}
            format.json { render json: @payment.errors, status: :unprocessable_entity }
          end

      end

  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.update_attribute(:status, 'N')
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:invoice_id, :amount, :date, :status)
    end
end
