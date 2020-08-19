Rails.application.routes.draw do
  devise_for :actors, path: 'actors', controllers: {
    sessions: 'actors/sessions'
  }
  devise_for :casting_agents, path: 'casting_agents', controllers: {
    sessions: 'casting_agents/sessions'
  }
  root to: 'pages#home'
  resources :auditions
  resources :actors
  resources :events
  resources :casting_agents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
