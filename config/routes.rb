Rails.application.routes.draw do
  
  devise_for :users

  # exposes only actions for user_profile and not user_
  resources :users, only: [] do
    resource :profile, only: [:edit, :show, :update]
  end
  
  root to: 'pages#home'
end
