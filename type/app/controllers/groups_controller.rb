class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy, :add]

  # GET /groups
  # GET /groups.json
  def index
    @groups = current_user.groups
  end
  def add
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)
    b = BulletinBoard.create
    @group.bulletin_board = b
    @user = current_user
    @user.groups << @group

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group.bulletin_board, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    @group = Group.find(params[:id])
    emailCheck = params[:email]
    respond_to do |format|
 	 if User.exists?(email: emailCheck) #MAKE SURE USER EXISTS
	    @user = User.where(email: emailCheck)
            if !@group.users.exists?(@user) #AVOID DUPLICATES
    	    	@group.users << @user      #ADD USER TO JOIN TABLE
            end
	    format.html { redirect_to groups_path, notice: 'User was successfully added to the group.' }
            format.json { render :index, status: :ok, location: @group }
 	  else
            format.html { redirect_to groups_path,  alert: 'USER DOES NOT EXIST!' }
            format.json { render :index, status: :unprocessable_entity, location: @group }
          end
       end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name, :create_date, :created_by, :email)
    end
end
