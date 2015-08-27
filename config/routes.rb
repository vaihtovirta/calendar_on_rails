Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users

  resources :users do
    resources :events, module: 'users', except: %i(show)
  end

  resources :events, only: %i(index show)
end
