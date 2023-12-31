Rails.application.routes.draw do
  devise_for :users
  
  root to: 'blogs#index'
  resources :blogs, except: [:show] do
    get 'date/:date', to: 'blogs#show_by_date', on: :collection, as: 'show_by_date', constraints: { date: /\d{4}-\d{2}-\d{2}/ }
  end
  
end
