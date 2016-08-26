Rails.application.routes.draw do
  get 'csas/index'

  get 'home/index'

  get 'welcome/index'

  get 'rsp/index'

  resources :csas

  resources :billing_accounts

  resources :rsps

  get '/api/v1/get_csas', to: 'api/v1/api#get_csas', defaults: {format: :json}
  get '/api/v1/get_billing_accounts', to: 'api/v1/api#get_billing_accounts', defaults: {format: :json}
  get '/api/v1/get_billing_account_csas', to: 'api/v1/api#get_billing_account_csas', defaults: {format: :json}



  get '/api/v1/get_account_csa_service_types', to: 'api/v1/api#get_account_csa_service_types', defaults: {format: :json}
  get '/api/v1/get_relationships', to: 'api/v1/api#get_relationships', defaults: {format: :json}
  get '/api/v1/get_rsps', to: 'api/v1/api#get_rsps', defaults: {format: :json}
  get '/api/v1/get_rsp_csa_exclusions', to: 'api/v1/api#get_rsp_csa_exclusions', defaults: {format: :json}
  get '/api/v1/get_rsp_technology_types', to: 'api/v1/api#get_rsp_technology_types', defaults: {format: :json}
  get '/api/v1/get_service_types', to: 'api/v1/api#get_service_types', defaults: {format: :json}
  get '/api/v1/get_csa_service_types', to: 'api/v1/api#get_csa_service_types', defaults: {format: :json}
  get '/api/v1/get_technology_types', to: 'api/v1/api#get_technology_types', defaults: {format: :json}

  get '/api/v1/get_inbounds', to: 'api/v1/api#get_inbounds', defaults: {format: :json}

  get 'billing_accounts/index'


  get 'db_locker/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
