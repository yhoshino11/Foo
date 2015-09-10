Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions'
  }
  root 'home#index'
  resources :users, only: [] do
    resources :contents, except: [:destroy]
    member do
      resource :profile, except: [:destroy]
    end
  end
end
