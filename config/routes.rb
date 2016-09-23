Rails.application.routes.draw do
  root 'site#index'

  # Authentication
  get '/auth/:provider/callback' => 'sessions#create', as: :omniauth_callback
  get '/signout' => 'sessions#destroy', as: :sign_out
end
