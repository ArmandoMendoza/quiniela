Rails.application.routes.draw do

  devise_for :users


  resources :pools
  resources :bets, except: [:new, :create, :show]

  resources :users do
    member do
      get :bets
      post :create_bets
    end
  end

  resources :matches do
    resources :scores, except: :show
  end
  root 'dashboard#index'
end
