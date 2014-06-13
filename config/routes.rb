Rails.application.routes.draw do

  devise_for :users

  resources :pools do
    resources :registrations, only: [:index, :destroy]
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

  get 'documents/my_bets/:pool_id', to: "documents#my_bets", as: 'documents_my_bets'

  post '/contact', to: 'home#contact', as: 'contacts'
  post '/registrations', to: 'home#registration', as: 'registrations'
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  root 'home#index'
end
