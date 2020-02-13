Rails.application.routes.draw do
  # postsのルーティング
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  
  # homeのルーティング
  get "/" => "home#top"
  get "info" => "home#info"
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
