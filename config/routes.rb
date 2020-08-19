Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/casting_agent_home', to: 'pages#casting_agent_home'
  get 'pages/actor_home', to: 'pages#actor_home'
  resources :requests, except: [:destroy, :update]
  post 'requests/:id', to: 'requests#destroy', as: 'delete_request'
  patch 'requests/:id', to: 'requests#update', as: 'update_request'
  resources :auditions, except: [:create]
  post 'auditions', to: 'auditions#create', as: 'create_audition'
  # resources :actors
  resources :events
  # resources :casting_agents
  devise_for :actors, path: 'actors', controllers: {
    sessions: 'actors/sessions'
  }
  devise_for :casting_agents, path: 'casting_agents', controllers: {
    sessions: 'casting_agents/sessions'
  }
  resources :actors
  resources :events
  resources :casting_agents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
