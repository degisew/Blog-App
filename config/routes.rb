Rails.application.routes.draw do
  root 'users#index'
  resources :users, shallow: true do
    resources :posts
  end
end
