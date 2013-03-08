GreenVote::Application.routes.draw do
  resources :activities

  match '/landing' => 'welcome#index', :defaults => {:tagid => "6442503"}
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :votes

  resources :rooms

  resources :about
  
  resources :buildings do
    resources :votes
    collection { post :import }
  end

  root :to => 'welcome#index'
  match '*a', :to => 'welcome#index'
end
