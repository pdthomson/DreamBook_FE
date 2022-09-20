Rails.application.routes.draw do
  root 'welcome#index'
  resources :users
  resources :sessions
  resources :blogs do
    resources :comments
  end

  get "/blogs/:id/comments/new", to: 'comments#new'
  get '/dashboard', to: 'users#show'
  get '/dashboard/update', to: 'users#edit'
  patch '/dashboard', to: 'users#update'
  get '/auth/google_oauth2/callback', to: 'users#create'
  # get '/auth/google_oauth2/callback', to: 'sessions#create'(depends on design decision)
end
