Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root to: 'welcome#index', as: :authenticated_root
    resources :products
    resources :questions
    resources :reviews
    resources :answers
    resources :responses
    resources :categories
    resources :welcome
  end
  resources :users
  resources :reviews, only: [:new, :show, :index, :create ]
  resources :welcome, only: [:show]
  resources :products, only: [:show]

  root to: redirect('/users/sign_in')
end
