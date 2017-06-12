Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'welcome/index'

  resources :restaurants

  root 'welcome#index'
end
