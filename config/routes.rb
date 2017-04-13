Rails.application.routes.draw do

  resources :transactions, except: [:show]

  post :incoming, to: 'incoming#create'

  get 'transactions/dashboard'

  get 'transactions/cashflow'

  get 'welcome/about'

  root 'welcome#index'

end
