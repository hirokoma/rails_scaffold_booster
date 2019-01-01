Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  resources :users,      only: [:show], shallow: true do
    #resources :comments, only: [:index], controller: 'users/comments'
    #resources :images,   only: [:index], controller: 'users/images'
    #resources :spots,    only: [:index], controller: 'users/likes'
  end

  root 'pages#index'
  get 'pages/show'
end