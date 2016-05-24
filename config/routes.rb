Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "callbacks"}
  root "products#index"

  resources :products, only: [:show, :index]
  resource :orders, only: [:show]
  resources :line_items, only: [:create, :update, :destroy]
  resources :suggestions

  namespace :admin do
    root "products#index"
    resources :products
    resources :users, only: [:index, :show, :destroy]
    resources :suggestions, only: [:index, :show, :destroy]
    resources :categories, expect: [:show]
  end
end
