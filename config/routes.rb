OAElections::Application.routes.draw do

  resources :districts

  resources :users
  
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'login', to: 'sessions#new', as: 'login'
  match 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :elections do
    collection do
      get :scheduled
    end
    resources :candidates
  end
  
  match '/token/:token' => 'sessions#token', as: 'token'
  match 'request_election' => 'elections#new', as: 'request_election'
  
  root :to => 'elections#new'


  resources :units
end
