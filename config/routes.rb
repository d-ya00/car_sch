Rails.application.routes.draw do
  devise_for :users
   resources :users, only: :show
  root to: 'blogs#index'
   resources :blogs
 
  authenticated :user do
    root to: 'blogs#index', as: :authenticated_root
  end
end