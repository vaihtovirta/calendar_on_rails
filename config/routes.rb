Rails.application.routes.draw do
  root to: "events#index"
  devise_for :users

  resources :users do
    resources :events,
              controller: "users/events",
              only: %i[create destroy edit index new update]
  end

  resources :events, only: %i[index show]
end
