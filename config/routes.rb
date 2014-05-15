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

  resources :matches, except: :show do
    resources :scores, except: :show
  end

  get 'dashboard/index', as: "dashboard"
  root 'home#index'
end
