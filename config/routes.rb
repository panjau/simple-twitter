Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  # 請依照專案指定規格來設定路由
  resources :users, only: [:edit, :update] do
    member do
      get :tweets
      get :followings
      get :followers
      get :likes
      post :like   
    end
  end

  resources :tweets
  root "tweets#index"

  namespace :admin do
    resources :tweets, only: [:index, :destroy]
    resources :users, only: [:index]
    root "tweets#index"
  end
end
