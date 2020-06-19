Rails.application.routes.draw do
  root 'homes#index'
  get 'about' => 'homes#about', as:'about'
  devise_for :users

  resource :stretchs, only: [:index, :show]
  get 'stretchs/index' => 'stretchs#index'

  resource :users, only: [:show, :edit]
  get 'users/edit_info' => 'users#edit_info'
  patch 'users/edit' => 'users#update'
  get 'users/edit_withdraw' => 'users#edit_withdraw', as: 'edit_user_withdraw'
  put 'users/withdraw' => 'users#withdraw', as: 'user_withdraw'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
