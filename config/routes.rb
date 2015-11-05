Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks" 
  }

  #devise_scope :user destroy
  #get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  #delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session

  post :incoming, to: 'incoming#create'
  
  get 'welcome/index'

  get 'welcome/about'

  #get '/auth/:provider/callback', :to => 'sessions#create'
  #get 'auth/failure', to: redirect('/')
  #get 'signout', to: 'sessions#destroy', as: 'signout'

  #resources :sessions, only: [:create, :destroy]
  resource :welcome, only: [:index]

  root to: 'welcome#index'
end
