Rails.application.routes.draw do
  # likesのルーティング
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  # usersのルーティング
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  post "login" => "users#login"
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id/destroy" => "users#destroy" 
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "users/:id" => "users#show"

  # postsのルーティング
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/:id/update" => "posts#update"
  post "posts/create" => "posts#create"
  get "posts/:id/destroy" => "posts#destroy" 
  # ↑これはpostじゃなくていい？
  get "posts/:id/edit" => "posts#edit"
  get "posts/:id" => "posts#show"
  
  # homeのルーティング
  get "/" => "home#top"
  get "info" => "home#info"
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
