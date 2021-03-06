Rails.application.routes.draw do
  devise_for :users
  root to: "item_displays#index"

  resources :item_displays do
    resources :item_purchases, only: [ :create, :index, :new ]
  end
  
end