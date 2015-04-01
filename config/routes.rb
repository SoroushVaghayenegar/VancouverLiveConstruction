Rails.application.routes.draw do

  get 'sessions/new'

  root 'welcome#index'

  get    'welcome' => 'welcome#index' #HOME
  get    'update' => 'welcome#update'
  get    'map'    => 'welcome#map'
  get    'about'   => 'welcome#about'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  get    'table' => 'welcome#table'
  post   'login'   => 'sessions#create'
  post   'delete_constr' => 'welcome#_delete'
  post   'pref' => 'users#_savePref'
  post   'load_data' => 'welcome#_loadData'
  delete 'logout'  => 'sessions#destroy'
  resources :users, :ipconstructions, :upconstructions, :rcconstructions


end
