Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :sessions, only: [:create, :destroy]

  root 'welcome#index'
  get 'welcome/index'
  
  get 'error/show'
  
  resources :polls do
    collection do
      get 'take'
      get 'featured'
    end
    resources :responses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end