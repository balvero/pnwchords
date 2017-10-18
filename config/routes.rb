Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'},
             :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :songs
  resources :artists
  resources :tags, only: [:index, :show]

  get 'my-songs', to: 'songs#my_songs'

  root 'songs#index'
end
