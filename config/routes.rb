Rails.application.routes.draw do
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
