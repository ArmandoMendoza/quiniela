Rails.application.routes.draw do
  resources :matches
  root 'dashboard#index'
end
