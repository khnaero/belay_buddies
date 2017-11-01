Rails.application.routes.draw do
  
  devise_for :users

  # exposes only actions for user_profile and not user_
  resources :users do
    resource :profile, only: [:index, :edit, :show, :update]
  end

  # resources :profiles, only: [] do
  resources :profiles, :shallow => true, only: [] do
    resources :reviews
  end

  root to: 'pages#home'
end
