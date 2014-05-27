class MagazinesController < ApplicationController
  before_action :confirm_logged_in
  before_action :is_power_login, except: [:index]
  before_action :set_magazine, only: [:show, :edit, :update, :destroy]
  
  # GET /magazines
  # GET /magazines.json
  def index
    @magazines = Magazine.where( :status => 'Y').order(:title).paginate(:page => params[:page], :per_page => 10)

    if session[:user_id]
      @user = User.find(session[:user_id])
      if is_power
        render :index
      else
        redirect_to main_index_path
      end
    else
      redirect_to main_index_path
    end
  end

  # GET /magazines/1
  # GET /magazines/1.json
  def show
  end

  # GET /magazines/new
  def new
    @magazine = Magazine.new
  end

  # GET /magazines/1/edit
  def edit
  end

  # POST /magazines
  # POST /magazines.json
  def create
    @magazine = Magazine.new(magazine_params)

    respond_to do |format|
      if @magazine.save
        format.html { redirect_to @magazine, notice: 'Magazine was successfully created.' }
        format.json { render action: 'show', status: :created, location: @magazine }
      else
        format.html { render action: 'new' }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /magazines/1
  # PATCH/PUT /magazines/1.json
  def update
    respond_to do |format|
      if @magazine.update(magazine_params)
        format.html { redirect_to @magazine, notice: 'Magazine was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @magazine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /magazines/1
  # DELETE /magazines/1.json
  def destroy
    
    @issues = Issue.where(:magazine_id => @magazine.id)    
    @fields = Field.where(:magazine_id => @magazine.id)

    @fields.update_all(:status =>'N')
    @issues.update_all(:status => 'N')
    @magazine.update_attribute(:status, 'N')
    respond_to do |format|
      format.html { redirect_to magazines_url, notice: 'Magazine was successfully deleted.'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magazine_params
      params.require(:magazine).permit(:title, :issue, :prints, :subscribers, :readership, :picture, :status)
    end
end
