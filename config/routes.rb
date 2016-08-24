Rails.application.routes.draw do
  get 'csas/index'

  get 'home/index'

  get 'welcome/index'

  get 'rsp/index'

  resources :csas

  get '/api/v1/get_csas', to: 'api/v1/api#get_csas', defaults: {format: :json}
  get '/api/v1/get_inbounds', to: 'api/v1/api#get_inbounds', defaults: {format: :json}

  get 'billing_account/index'


  get 'db_locker/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
