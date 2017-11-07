Rails.application.routes.draw do
  
  devise_for :users

  # exposes only actions for user_profile and not user_
  resources :users, only: [:index] do
    resource :profile, only: [:index, :edit, :show, :update]
  end

  resources :profiles do
  # resources :profiles, :shallow => true, only: [] do
    resources :reviews
    # resources :reviews, except: [:show, :index]
  end

  root to: 'pages#home'
end
