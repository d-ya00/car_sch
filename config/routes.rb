Rails.application.routes.draw do
  root to: 'blogs#index'
  resources :blogs
  devise_for :users
end