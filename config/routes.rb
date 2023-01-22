Rails.application.routes.draw do


  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    resources :drive_routes, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :update, :destroy]
    resources :tags, only: [:index, :create, :edit, :update, :destroy] do
      resources :drive_comments, only: [:destroy]
    end
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :likes, only: [:index]
    resources :drive_reports, only: [:new, :create, :edit, :update, :index, :show]
    resources :drive_routes do
      resources :routes, only: [:index, :create, :destroy]
      resources :drive_comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
    get '/users/check' => 'users#check'
    resources :users, only: [:index, :edit, :update, :show, :destroy] do
      member do
        get :likes
      end
    end

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
