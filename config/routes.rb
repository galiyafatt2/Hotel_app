# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :bookings
  resources :rooms, only: %i[index show]
  resources :reviews, only: %i[index show create]

  namespace :admin do
    resources :bookings, only: %i[index show update destroy]
    resources :reviews
    resources :rooms
    root 'pages#index'
    post 'rooms/:id', controller: 'rooms', action: :update
  end
  root 'pages#index'
end
