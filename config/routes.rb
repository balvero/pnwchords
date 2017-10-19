Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations' }

  resources :songs
  resources :artists
  resources :tags, only: [:index, :show]

  get 'my-songs', to: 'songs#my_songs'

  root 'songs#index'
end
