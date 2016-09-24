Rails.application.routes.draw do
  root 'site#index'

  # Authentication
  get '/auth/:provider/callback' => 'sessions#create', as: :omniauth_callback
  get '/signout' => 'sessions#destroy', as: :sign_out

  get 'activities/new_timer', as: :new_timer
  post 'activities/create_timer', as: :create_timer
  put 'activities/:id/status' => 'activities#update_status', as: :update_status
  resources :activities
  resources :projects
end
