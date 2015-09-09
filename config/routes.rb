Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, only: [] do
    resources :contents, except: [:destroy]
  end
end
