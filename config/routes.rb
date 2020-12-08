Rails.application.routes.draw do
  
  get 'search/search'
  root 'homes#top'
  get 'home/about' => 'homes#about'
  get '/search' => 'search#search'

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
    get :search, on: :collection
  end
end