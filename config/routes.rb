Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  get 'welcome/index'

  resources :restaurants do
    resources :reservations
    match 'star', to: 'stars#star', via: :put
    match 'unstar', to: 'stars#unstar', via: :delete
  end

  get 'dashboard', to: "restaurants#dashboard"

  root 'welcome#index'
end
