Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome' => 'welcome#index'

  get 'signup' => 'users#new'
  resources :users
end
