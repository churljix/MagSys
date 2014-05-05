class FieldsController < ApplicationController

  before_action :confirm_logged_in, except: [ :index]
  before_action :set_field, only: [:show, :edit, :update, :destroy]
  
  before_action :find_magazine
  before_action :find_issue
  # GET /fields
  # GET /fields.json
  def index
    @fields = Field.where(:magazine_id => params[:magazine_id]).order(:height, :width)
    
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.admin? or @user.editor?
        render :index
      else
        render :index_other
      end
    else
      render :index_other
    end
  end

  def index_other
    @fields = Field.where(:magazine_id => params[:magazine_id]).order(:height, :width)
  end

  # GET /fields/1
  # GET /fields/1.json
  def show
  end

  # GET /fields/new
  def new
    @field = Field.new
  end

  # GET /fields/1/edit
  def edit
  end

  # POST /fields
  # POST /fields.json
  def create
    @field = Field.new(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to [@magazine, @field], notice: 'Field was successfully created.' }
        format.json { render action: 'show', status: :created, location: @field }
      else
        format.html { render action: 'new' }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fields/1
  # PATCH/PUT /fields/1.json
  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to [@magazine, @field], notice: 'Field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields/1
  # DELETE /fields/1.json
  def destroy
    @field.destroy
    respond_to do |format|
      format.html { redirect_to magazine_fields_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_params
      params.require(:field).permit(:title, :height, :width, :price, :magazine_id)
    end

    def find_magazine
      @magazine = Magazine.find(params[:magazine_id])
    end

    def find_issue
      @issue = Issue.find(params[:issue_id])
    end
end
