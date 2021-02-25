Rails.application.routes.draw do
  devise_for :users
  root to: "item_displays#index"
  
end
