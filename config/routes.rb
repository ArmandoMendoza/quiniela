Rails.application.routes.draw do

  devise_for :users

  resources :pools do
    resources :registers, only: [:index, :destroy]
  end

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

  resources :answers, only: :update
  post '/contact', to: 'home#contact', as: 'contacts'
  post '/register', to: 'home#register', as: 'registers'
  get 'dashboard/index', as: 'dashboard'
  root 'home#index'
end
