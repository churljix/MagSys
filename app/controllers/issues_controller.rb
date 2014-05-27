class IssuesController < ApplicationController
  before_action :confirm_logged_in, except: [ :index]
  before_action :is_power_login, except: [ :index, :index_other]
  before_action :find_magazine
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.where(:magazine_id => params[:magazine_id], :status => 'Y').order(:number).paginate(:page => params[:page], :per_page => 10)
    if session[:user_id]
      @user = User.find(session[:user_id])
      if is_power
        render :index
      else
        render :index_other
      end
    else
      render :index_other
    end
  end

   def index_other
     @issues = Issue.where(:magazine_id => params[:magazine_id], :status => 'Y').order(:number).paginate(:page => params[:page], :per_page => 10)
   end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to [@magazine, @issue], notice: 'Issue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @issue }
      else
        format.html { render action: 'new' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to [@magazine, @issue], notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue_count = Issue.where(:magazine_id => @issue.magazine_id).count
    if @issue_count > 1 
      @issue.update_attribute(:status, 'N')
    else
      @fields = Field.where(:magazine_id => @magazine.id)
      @fields.update_all(:status =>'N')
      @issue.update_attribute(:status, 'N')
    end
    respond_to do |format|
      format.html { redirect_to magazine_issues_url, notice: 'Issue was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:magazine_id, :number, :date, :due_date, :status)
    end

    def find_magazine
      @magazine = Magazine.find(params[:magazine_id])
    end
end
