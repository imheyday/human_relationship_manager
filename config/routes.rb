Rails.application.routes.draw do
  resources :candidates
  resources :job_applications

  # CLEARANCE
  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]
  resources :users, controller: 'clearance/users', only: [:create] do
    resource :password, controller: 'clearance/passwords', only: [:create, :edit, :update]
  end
  get '/sign_in' => 'sessions#new', as: 'sign_in'
  delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  get '/sign_up' => 'users#new', as: 'sign_up'
  get '/auth/google/callback' => 'sessions#auth_with_google', as: 'auth_with_google'
  # END OF CLEARANCE

  root 'job_applications#index'
end
