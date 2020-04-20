Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  devise_for :users
  get '/search' => 'search#search'
  resources :users, only: [:show, :index, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  get 'users/:id/edit/leave' => 'users#leave', as: 'leave'
  # as: ''で名前付きルートにできる
  resources :games do
    resource :game_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
