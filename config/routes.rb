Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  # User Signup
  get '/', to:'users#index', as: 'home'
  get '/signup', to:'users#new', as: 'signup'
  post '/signup', to:'users#create'

  # User Login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # User Dashboard/Company Applying to
  get '/dashboard', to: 'entries#index', as: 'dashboard'
  get '/new/entry', to: 'entries#new', as: 'entries'
  post '/new/entry', to: 'entries#create'
  get '/entry/:id', to: 'entries#show', as: 'entry'
  get '/entries/:user_id', to: 'entries#chart'
  get '/entry/:id/edit', to: 'entries#edit', as: 'edit_entry'
  put 'entry/:id', to: 'entries#update', as:'update_entry'
  patch 'entry/:id', to: 'entries#update'
  delete 'entry/:id', to: 'entries#destroy'

  # User Profile
  get '/profile', to: 'profiles#index', as: 'my_profile'
  get '/new/profile', to: 'profiles#new'
  post '/new/profile', to: 'profiles#create'
  get '/profile/:id', to: 'profiles#edit', as: 'profile'
  put '/profile/:id', to: 'profiles#update'
  patch '/profile/:id', to: 'profiles#update'
end
