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
  end
  resources :users
  resources :reviews, only: [:new, :show, :index, :create]
  resources :welcome, only: [:show]

  root to: redirect('/users/sign_in')
end
