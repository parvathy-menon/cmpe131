class TypeiosController < ApplicationController
  before_action :set_typeio, only: [:show, :edit, :update, :destroy]

  # GET /typeios
  # GET /typeios.json
  def index
    @typeios = current_user.typeio
  end

  # GET /typeios/1
  # GET /typeios/1.json
  def show
  end

  # GET /typeios/new
  def new
    @typeio = Typeio.new
  end

  # GET /typeios/1/edit
  def edit
  end

  # POST /typeios
  # POST /typeios.json
  def create
      # @bulletin_board = BulletinBoard.find(params[:bulletin_board_id])
      # @typeio = @bulletin_board.typeios.create(typeio_params)
      @typeio = Typeio.new(typeio_params)
      @typeio.user = current_user
	
    respond_to do |format|
      if @typeio.save
        format.html { redirect_to @typeio, notice: 'Typeio was successfully created.' }
        format.json { render :show, status: :created, location: @typeio }
      else
        format.html { render :new }
        format.json { render json: @typeio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /typeios/1
  # PATCH/PUT /typeios/1.json
  def update
    respond_to do |format|
      if @typeio.update(typeio_params)
        format.html { redirect_to @typeio, notice: 'Typeio was successfully updated.' }
        format.json { render :show, status: :ok, location: @typeio }
      else
        format.html { render :edit }
        format.json { render json: @typeio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /typeios/1
  # DELETE /typeios/1.json
  def destroy
    @typeio.destroy
    respond_to do |format|
      format.html { redirect_to typeios_url, notice: 'Typeio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typeio
      @typeio = Typeio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def typeio_params
      params.require(:typeio).permit(:body)
    end
end
