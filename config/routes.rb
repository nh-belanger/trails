Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/pages/:page" => "pages#show"

  get "/pages/tickets" => "pages#tickets"

  resources :users
  resources :trails do
    resources :maintenancetickets
  end

  root 'pages#show', page: 'home'

end
