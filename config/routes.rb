Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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

  get '/events/new' => "events#new"
  post '/events' => "events#create"
  patch '/events/:id' => "events#update"
  delete '/events/:id' => "events#delete"

  post '/venues/:group_id' => "venues#create"

end
