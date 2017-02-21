Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get "/pages/:page" => "pages#show"
  
  resources :users
  resources :trails

  root 'pages#show', page: 'home'
end
