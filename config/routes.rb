Rails.application.routes.draw do

  root "home#top"
  get "/about", to: "home#about"

  resources :users, :only => [:index, :create, :edit, :show, :update, :destroy]
  get "/signup", to: "users#new"
  post "/login", to: "users#login"
  get "/login", to: "users#login_form"
  post "/logout", to: "users#logout"
  get "/users/:id/likes", to: "users#likes"
  
  resources :posts, :only => [:index, :new, :create, :edit, :show, :update, :destroy]
  # get "/posts_index", to: "posts#index"
  # get "/posts_new", to: "posts#new"
  # post "/posts_create", to: "posts#create"
  # get "/posts/:id/edit", to: "posts#edit"
  # post "/posts/:id/update", to: "posts#update"
  # post "/posts/:id/destroy", to: "posts#destroy"
  # get "/posts/:id", to: "posts#show"
  
  post "/likes/:post_id/create", to: "likes#create"
  post "/likes/:post_id/destroy", to: "likes#destroy"

end
