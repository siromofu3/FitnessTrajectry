Rails.application.routes.draw do

  root "home#top"
  get "/about", to: "home#about", as: :about
  get "/contact", to: "home#contact", as: :contact
  get "/terms", to: "home#terms", as: :terms

  resources :users, :only => [:index, :create, :edit, :show, :update, :destroy]
  get "/signup", to: "users#new"
  post "/login", to: "users#login"
  get "/login", to: "users#login_form"
  post "/logout", to: "users#logout"
  get "/users/:id/likes", to: "users#likes"
  
  resources :posts, :only => [:index, :new, :create, :edit, :show, :update, :destroy]
  
  post "/likes/:post_id/create", to: "likes#create"
  post "/likes/:post_id/destroy", to: "likes#destroy"

end
