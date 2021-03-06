class AgenciesController < ApplicationController
  before_action :confirm_logged_in, except: [ :new, :create]
  before_action :is_power_login, only: [:edit, :update, :destroy]
  before_action :set_agency, only: [:show, :edit, :update, :destroy]

  # GET /agencies
  # GET /agencies.json
  def index
    @agencies = Agency.where(:status => 'Y').paginate(:page => params[:page], :per_page => 10)
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
    require "prawn"

  Prawn::Document.generate("hello.pdf") do
    text "Hello World!"
    end
  end

  # GET /agencies/new
  def new
    @agency = Agency.new
    session[:redirect_to] = request.referer
  end

  # GET /agencies/1/edit
  def edit
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(agency_params)
    respond_to do |format|
      if @agency.save
        format.html { redirect_to session[:redirect_to], notice: 'Agency was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @agency }
      else
        format.html { render action: 'new' }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    respond_to do |format|
      if @agency.update(agency_params)
        format.html { redirect_to @agency, notice: 'Agency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    @agency.update_attribute(:status, 'N')
    respond_to do |format|
      format.html { redirect_to agencies_url, notice: 'Agency was successfully deleted.'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agency
      @agency = Agency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agency_params
      params.require(:agency).permit(:title, :reg_number, :address, :phone, :status)
    end
end
