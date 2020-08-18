Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :casting_agents
  resources :auditions
  resources :actors
  resources :events
  resources :casting_agents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
