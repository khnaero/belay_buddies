Rails.application.routes.draw do
  
  devise_for :users

  resources :users do
    resource :profile
  end
  
  
  root :to => 'pages#home'
end
