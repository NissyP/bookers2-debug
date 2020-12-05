Rails.application.routes.draw do
  
  root 'homes#top'
  get 'home/about' => 'homes#about'

  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    get 'follower' => 'relationships#follower'
    get 'followed' => 'relationships#followed'
  end
  
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end