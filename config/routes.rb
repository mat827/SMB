Rails.application.routes.draw do
  devise_for :admins, skip: :all #スキップして以下のルーティングのみ機能（devise_scope)
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  root 'homes#index'
  get 'about' => 'homes#about', as:'about'
  devise_for :users

  resource :stretchs, only: [:index, :show]
  get 'stretchs/index' => 'stretchs#index'
  get 'stretchs/:id' =>'stretchs#show', as: 'stretchs_show'

  resource :users, only: [:show, :edit]
  get 'users/edit_info' => 'users#edit_info'
  patch 'users/edit' => 'users#update'
  get 'users/edit_withdraw' => 'users#edit_withdraw', as: 'edit_user_withdraw'
  put 'users/withdraw' => 'users#withdraw', as: 'user_withdraw'

  get 'category/:id'=> 'categorys#search', as: 'categorys_search'

  namespace :admins do
    resources :categorys, only: [:index, :create, :edit, :update]
    resources :stretchs, except: :destroy #except(destroy以外)
    resources :users, only: [:index, :show, :edit, :update]
    get '/homes' => 'homes#index', as: 'homes'
    get '/search' => 'searches#search', as: 'search'
  end
end
