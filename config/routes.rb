Rails.application.routes.draw do
  devise_for :users
  get 'item_displays/index'
  root to: "item_displays#index"
  
end
