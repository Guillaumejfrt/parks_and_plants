Rails.application.routes.draw do
  resources :gardens do
    # We need a garden_id in the create action of the PlantsController to
    # create a plant associated to its garden.

    # So we need the garden_id to be in the params.

    # So we nest the resources :plants inside the resources :gardens (for the
    # create action only) to get the garden_id in the url.
    resources :plants, only: :create
  end

  # In the destroy action of the PlantsController we don't need a garden_id to
  # find the plant in DB. We only need the plant_id for that.

  # So we don't nest the resources :plants for the destroy action.
  resources :plants, only: :destroy

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
