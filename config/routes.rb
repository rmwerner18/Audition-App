Rails.application.routes.draw do
  root to: 'pages#home'
  resources :requests, except: [:destroy, :update]
  post 'requests/:id', to: 'requests#destroy', as: 'delete_request'
  patch 'requests/:id', to: 'requests#update', as: 'update_request'
  resources :auditions, except: [:create]
  post 'auditions', to: 'auditions#create', as: 'create_audition'
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
