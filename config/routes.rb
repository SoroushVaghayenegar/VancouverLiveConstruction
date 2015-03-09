Rails.application.routes.draw do
  
  get 'welcome/index'

  root 'welcome#index'

  resources :ipconstructions, :upconstructions, :rcconstructions

end
