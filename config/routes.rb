Rails.application.routes.draw do

  resources :matches do
    resources :scores, except: :show
  end
  root 'dashboard#index'
end
