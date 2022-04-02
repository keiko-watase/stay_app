Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :users
  resources :rooms do
    collection do
      get 'search', to: 'rooms#search'
    end
  end
  resources :resavations, only: [ :index, :new, :show, :create]
  post 'resavations/confirm'
  post 'resavations/back'
end
