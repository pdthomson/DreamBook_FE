Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:index, :new]
  resources :sessions, only: [:new]
  resources :blogs, only: [:index]
end
