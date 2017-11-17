Rails.application.routes.draw do
  devise_for :users
  
  root 'welcome#index'
  get 'welcome/index'
  
  resources :polls do
    collection do
      get 'take'
      get 'featured'
    end
    resources :responses
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end