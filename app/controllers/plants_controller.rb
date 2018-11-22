class PlantsController < ApplicationController
  # POST "gardens/:garden_id/plants/new"
  def create
    # Here we need the garden_id to find the garden and associate it to the plant.
    # This is why, in our routes.rb, we nested the :plants resources inside the
    # :gardens resources only for the :create action
    @plant = Plant.new(plant_params)
    @garden = Garden.find(params[:garden_id])
    @plant.garden = @garden

    if @plant.save
      redirect_to garden_path(@garden)
    else
      # Here we render "gardens/show" instead of rendering directly :show.
      # This is normal: as we are in the PlantsController, rendering :show would
      # render the show.html.erb of the '/views/plants' folder.
      # We are obliged to specify to the PlantsController that it must render the
      # show.html.erb which is inside the 'views/gardens' folder.
      render "gardens/show"
    end
  end

  # DELETE "plants/:id"
  def destroy
    plant = Plant.find(params[:id])
    # Before deleting the plant, we must store the garden of the plant in a variable
    # so that we can redirect the user to the garden' show thanks to the
    # garden_path helper.
    garden = plant.garden
    plant.destroy
    redirect_to garden_path(garden)
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url)
  end
end
