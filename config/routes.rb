Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  get 'welcome/index'

  resources :restaurants do
    resources :reservations
  end

  match 'star', to: 'stars#star', via: :post
  match 'unstar', to: 'stars#unstar', via: :delete

  get 'dashboard', to: "restaurants#dashboard"

  root 'welcome#index'
end
