class TinsController < ApplicationController
  before_action :set_tin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show] 

  def index
    @tins = Tin.all
  end

  def show
  end

  def new
    @tin = current_user.tins.build
  end

  def edit
  end

  def create
    @tin = current_user.tins.build(tin_params)

    respond_to do |format|
      if @tin.save
        format.html { redirect_to @tin, notice: 'Tin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tin }
      else
        format.html { render action: 'new' }
        format.json { render json: @tin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tin.update(tin_params)
        format.html { redirect_to @tin, notice: 'Tin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tin.destroy
    respond_to do |format|
      format.html { redirect_to tins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tin
      @tin = Tin.find(params[:id])
    end

    # Checks to see whether the existing pin already belongs to the current user.  It does it by
    # seeing if you can find the existing pin amongst the pins belonging to the current user.
    def correct_user
      @tin = current_user.tins.find_by(id: params[:id])
      redirect_to tins_path, notice: "Not authorised to edit this tin!" if @tin.nil?

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tin_params
      params.require(:tin).permit(:description)
    end
end
