Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  get 'welcome/index'

  resources :restaurants do
    resources :reservations
  end

  root 'welcome#index'
end
