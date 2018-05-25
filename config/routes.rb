Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  post "/users" => "users#create"
  
  namespace :api do
    get '/products' => 'products#index'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'
    patch '/products/:id' =>'products#update'
    delete '/products/:id' => 'products#destroy'
  end
end
