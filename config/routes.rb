Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: redirect('/albums')

  get 'albums', to: 'albums#index', as: 'albums'
  post 'albums/:album_id/tracks', to: 'tracks#create'
  get 'tracks/new', to: 'tracks#new', as: 'new_track'
  get 'albums/:album_id/tracks/new', to: 'tracks#new', as: 'new_album_track'
  get '/albums/:album_id/tracks/:id/edit', to: 'tracks#edit', as: 'edit_album_track'
  post 'albums', to: 'albums#create'
  get 'albums/new', to: 'albums#new', as: 'new_album'
  get 'albums/:id', to: 'albums#show', as: 'album'
  patch 'albums/:id', to: 'albums#update'
  put 'albums/:id', to: 'albums#update'
  delete 'albums/:id', to: 'albums#destroy'
  get 'albums/:id/edit', to: 'albums#edit', as: 'edit_album'
  get 'tracks', to: 'tracks#index', as: 'tracks'
  get 'albums/:album_id/tracks', to: 'tracks#index', as: 'album_tracks'
  get 'tracks/:id', to: 'tracks#show', as: 'track'
  get 'albums/:album_id/tracks/:id', to: 'tracks#show', as: 'album_track'
  patch '/albums/:album_id/tracks/:id', to: 'tracks#update'
  delete '/quizzes/:quiz_id/questions/:id', to: 'questions#destroy'




 
end
