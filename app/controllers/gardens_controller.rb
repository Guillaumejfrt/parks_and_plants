class GardensController < ApplicationController
  before_action :set_garden, only: [:show, :edit, :update, :destroy]

  # GET "/gardens"
  def index
    @gardens = Garden.all
  end

  # GET "/gardens/:id"
  def show
    # @garden is provided by the before_action method :set_garden
    # :set_garden is called before the show action
    # :set_garden is located at the end of the file under private

    # We provide @plant as a new instance so that simple_form knows that it
    # will have to POST on the create action of the PlantsController
    @plant = Plant.new
  end

  # GET "/gardens/new"
  def new
    @garden = Garden.new
  end

  # GET "/gardens/:id/edit"
  def edit
  end

  # POST "/gardens"
  def create
    @garden = Garden.new(garden_params)
    if @garden.save
      redirect_to @garden
    else
      render :new
    end
  end

  # PATCH "/gardens/:id"
  def update
    if @garden.update(garden_params)
      redirect_to @garden
    else
      render :edit
    end
  end

  # DELETE "/gardens/:id"
  def destroy
    @garden.destroy
    respond_to do |format|
      format.html { redirect_to gardens_url, notice: 'Garden was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garden
      @garden = Garden.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garden_params
      params.require(:garden).permit(:name, :banner_url)
    end
end
