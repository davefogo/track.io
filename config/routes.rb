Rails.application.routes.draw do

  resources :transactions, except: [:show]

  get 'transactions/dashboard'

  get 'welcome/about'

  root 'welcome#index'

end
