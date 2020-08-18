Rails.application.routes.draw do
  resources :requests, except: [:destroy, :update]
  post 'requests/:id', to: 'requests#destroy', as: 'delete_request'
  patch 'requests/:id', to: 'requests#update', as: 'update_request'
  resources :auditions, except: [:create]
  post 'auditions', to: 'auditions#create', as: 'create_audition'
  root to: 'pages#home'
  devise_for :casting_agents
  resources :auditions
  resources :actors
  resources :events
  resources :casting_agents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
