Rails.application.routes.draw do
  resources :auditions
  resources :actors
  resources :events
  resources :casting_agents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
