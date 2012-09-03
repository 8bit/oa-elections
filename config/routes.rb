OAElections::Application.routes.draw do

  resources :districts

  resources :users
  resources :sessions
  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :elections do
    collection do
      get :scheduled
    end
    resources :candidates
  end
  
  match '/token/:token' => 'sessions#token', as: 'token'
  match 'request_election' => 'elections#new', as: 'request_election'
  
  root :to => 'welcome#index'
end
