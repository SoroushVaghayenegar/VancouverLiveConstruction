Rails.application.routes.draw do

  get 'sessions/new'

  root 'welcome#index'

  get    'welcome' => 'welcome#index' #HOME
  get    'help'    => 'welcome#help'
  get    'about'   => 'welcome#about'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users, :ipconstructions, :upconstructions, :rcconstructions
  get 'update' => 'welcome#update'

end
