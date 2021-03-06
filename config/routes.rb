# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  devise_for :admins, skip: :all # スキップして以下のルーティングのみ機能（devise_scope)
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  root 'homes#index'
  get 'about' => 'homes#about', as: 'about'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :stretchs, only: %i(index show)

  resources :users, only: %i(show edit)
  patch 'users/:id/edit' => 'users#update', as: 'update'
  get 'users/:id/edit_withdraw' => 'users#edit_withdraw', as: 'edit_user_withdraw'
  put 'users/withdraw' => 'users#withdraw', as: 'user_withdraw'
  patch 'users/:id/sort', to: 'users#sort'

  get 'category/:id' => 'categorys#search', as: 'categorys_search'

  resources :favorites, only: %i(destroy create)

  resources :reviews, only: %i(new create destroy show edit update index)

  resources :contacts

  namespace :admins do
    resources :categorys, only: %i(index create edit update)
    resources :stretchs, except: :destroy # except(destroy以外)
    resources :users, only: %i(index show edit update)
    get '/homes' => 'homes#index', as: 'homes'
    get '/search' => 'searches#search', as: 'search'
    resources :contacts
  end
end
