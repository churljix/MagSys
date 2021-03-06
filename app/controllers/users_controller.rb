class UsersController < ApplicationController
  before_action :confirm_logged_in, :except => [ :show, :create, :new]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_agencies
  before_action :is_power_user, only: [:index, :destroy]
  before_action :set_roles
  before_action :user_user, only: [:show]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.roles = :agent
  end

  # GET /users/1/edit
  def edit
  end

  def add
    @user = User.find(params[:con_pk])
      if params[:role_id].include?('1')
        @user.roles = :agent
      elsif params[:role_id].include?('4')
        @user.roles = :admin
      end  

    redirect_to users_path
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.roles = :agent
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.update_attribute(:status, 'N')
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :name, :last_name, :email, :phone, :agency_id, :password, :password_confirmation, :status)
    end

    def set_roles
      @roles = Role.where(:id => [1,4])
    end

    def user_user
      if is_power
        return true
      else
        if @user.id == session[:user_id]
          return true
        else
          flash[:notice]= "No premission to view this content"  
          redirect_to(users_path(:id => session[:user_id]))      
          return false
        end
      end
    end

end
