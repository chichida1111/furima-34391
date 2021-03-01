Rails.application.routes.draw do
  devise_for :users
  root to: "item_displays#index"

  resources :item_displays, only: [:index, :new, :create, :show, :edit, :update, :destroy ]
  
end
