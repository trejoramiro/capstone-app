Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages

  get '/' => 'pages#index'
  get '/example' => 'pages#example'

  get '/groups' => 'groups#index'
  get '/groups/new' => 'groups#new'
  post '/groups' => 'groups#create'
  get '/groups/:id' => 'groups#show'
  get '/groups/:id/edit' => 'groups#edit'
  patch '/groups/:id' => 'groups#update'
  delete '/groups/:id' => 'groups#delete'

  get '/signup' => 'users#new'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'

  get '/events/:group_id/new' => 'events#new'
  post '/events/:group_id' => 'events#create'
  patch '/events/:id' => 'events#update'
  delete '/events/:id' => 'events#delete'

  get '/venues/:group_id' => 'venues#index'
  post '/venues/:group_id/:search_term' => 'venues#create'

  get '/votes/:group_id/:event_id' => 'votes#show'
  post '/votes/:group_id' => 'votes#update'

  post '/locations/:group_id' => 'locations#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # get '/messages' => 'messages#index'
  post '/messages' => 'messages#create'
  # get '/messages/:message_id' => 'messages#show'

  get '/chatroom' => 'chatrooms#index'

  get '/send' => 'twilios#index'
  post '/reply' => 'twilios#reply'

  namespace :api do
    namespace :v1 do
      get '/messages' => 'messages#index'
      post '/messages' => 'messages#create'

      get '/circles' => 'd3s#index'

      get '/maps' => 'maps#index'
    end
  end

end
