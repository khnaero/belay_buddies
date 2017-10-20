Rails.application.routes.draw do
  
  devise_for :users
  resources :profiles
  
  root :to => 'pages#home'
end
