Rails.application.routes.draw do

  devise_for :users

  resources :users

  resources :matches do
    resources :scores, except: :show
  end
  root 'dashboard#index'
end
