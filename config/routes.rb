Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "groups#index"
  get '/groups' => "groups#index"
  get '/groups/new' => "groups#new"
  post '/groups' => "groups#create"
  get '/groups/:id' => "groups#show"
  get '/groups/:id/edit' => "groups#edit"
  patch '/groups/:id' => "groups#update"
  delete '/groups/:id' => "groups#delete"

  get '/users/:id' => "users#show"
  get '/users/:id/edit' => "users#edit"
  patch '/users/:id' => "users#update"

  get '/events/:group_id/new' => "events#new"
  post '/events/:group_id' => "events#create"
  patch '/events/:id' => "events#update"
  delete '/events/:id' => "events#delete"

  post '/venues/:group_id' => "venues#create"

  get '/votes/:group_id/:event_id' => "votes#show"
  post '/votes/:group_id' => "votes#create"

  post '/locations/:group_id' => "locations#create"

end
