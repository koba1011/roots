Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
    collection do
      get 'search'
    end
    collection do
      get 'favorites'
    end
  end
  resources :users, only: [:show, :edit, :update]
end
