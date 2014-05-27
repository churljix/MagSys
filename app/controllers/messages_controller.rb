class MessagesController < ApplicationController
  before_action :confirm_logged_in
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :user_messages, only: [:show, :edit, :update, :destroy]
  
  before_action :set_power_users, only: [:new]
  before_action :set_users
  helper_method :user_reply
  helper_method :user_admins
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where(:status => 'S').paginate(:page => params[:page], :per_page => 10).where(:recipient_id => session[:user_id])
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message.visible = false 
    @message.save
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  # def edit
  # end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
      respond_to do |format|
        if @message.save
          format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
          format.json { render action: 'index', status: :created, location: @message }
        else
          format.html { render action: 'new' }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      end
  end

  # # PATCH/PUT /messages/1
  # # PATCH/PUT /messages/1.json
  # def update
  #   respond_to do |format|
  #     if @message.update(message_params)
  #       format.html { redirect_to @message, notice: 'Message was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @message.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.update_attribute(:status, 'D')
    respond_to do |format|
      format.html { redirect_to messages_url,notice: 'Message was successfully deleted.'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:user_id, :recipient_id, :text, :status, :visible)
    end

    def set_power_users
      if is_power
        @users = User.where(:status => 'Y').where.not(id: session[:user_id] )
      else
        @power_users = UserRole.select('user_id').where(:role_id => [4,2])
        @users = User.where(:status => 'Y').where(:id => @power_users)
      end
    end

    def user_messages
    if is_power
      return true  
    else  
      if (@message.recipient_id == session[:user_id] or @message.user_id == session[:user_id]) and @message.status != 'D'
        return true
      else
        flash[:notice]= "No premission to view this content"  
        redirect_to(messages_path)      
        return false
      end
    end
  end

    def user_reply(cid)
      @user_reply = User.where(:id => cid)
      #@user_reply = @user_replys.username
      return @user_reply
    end

    def user_admins
      @role = UserRole.select("user_id").where(:role_id => 4)
      @admins = User.where(:id => @role)
      return @admins
    end
end
