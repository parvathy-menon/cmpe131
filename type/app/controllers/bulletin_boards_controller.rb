class BulletinBoardsController < ApplicationController
  before_action :set_bulletin_board, only: [:show,:showByLikes, :edit, :update, :destroy]

  # GET /bulletin_boards
  # GET /bulletin_boards.json
  def index
    @bulletin_boards = BulletinBoard.all
    
  end


  # GET /bulletin_boards/1
  # GET /bulletin_boards/1.json


  def show
    #grabs all the current user's groups' bulletin_boards
    @bids = current_user.groups.collect(&:bulletin_board_id)

    #only display the boards that the user should have access to
    if current_user.bulletin_board == @bulletin_board || @bids.grep(@bulletin_board.id).any?
       @ptypeios = @bulletin_board.typeio #used to extract pinned posts
       @typeios = @bulletin_board.typeio #used for all regular posts

    #otherwise take user to their personal bulletin board!
    else
      redirect_to current_user.bulletin_board
      flash[:notice] = "You do not have access to that bulletin board"
    end
  end
  
  def showByLikes
    #grabs all the current user's groups' bulletin_boards
    @bids = current_user.groups.collect(&:bulletin_board_id)

    #only display the boards that the user should have access to
    if current_user.bulletin_board == @bulletin_board || @bids.grep(@bulletin_board.id).any?
       @ptypeios = @bulletin_board.typeio #used to extract pinned posts
       @typeios = @bulletin_board.typeio #used for all regular posts

    #otherwise take user to their personal bulletin board!
    else
      redirect_to current_user.bulletin_board
      flash[:notice] = "You do not have access to that bulletin board"
    end

    render :showByLikes
  end 

  # GET /bulletin_boards/new
  def new
    @bulletin_board = BulletinBoard.new
  end

  # GET /bulletin_boards/1/edit
  def edit
  end

  # POST /bulletin_boards
  # POST /bulletin_boards.json
  def create
    @bulletin_board = BulletinBoard.new(bulletin_board_params)

    respond_to do |format|
      if @bulletin_board.save
        format.html { redirect_to @bulletin_board, notice: 'Bulletin board was successfully created.' }
        format.json { render :show, status: :created, location: @bulletin_board }
      else
        format.html { render :new }
        format.json { render json: @bulletin_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bulletin_boards/1
  # PATCH/PUT /bulletin_boards/1.json
  def update
    respond_to do |format|
      if @bulletin_board.update(bulletin_board_params)
        format.html { redirect_to @bulletin_board, notice: 'Bulletin board was successfully updated.' }
        format.json { render :show, status: :ok, location: @bulletin_board }
      else
        format.html { render :edit }
        format.json { render json: @bulletin_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulletin_boards/1
  # DELETE /bulletin_boards/1.json
  def destroy
    @t = @bulletin_board.typeio.find(params[:typeio_id])
    @t.destroy
    respond_to do |format|
      format.html { redirect_to bulletin_boards_url, notice: 'Bulletin board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulletin_board
          @bulletin_board = BulletinBoard.find(params[:id])	  
    end
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def bulletin_board_params
      params.require(:bulletin_board).permit(:num_posts)
    end
end
