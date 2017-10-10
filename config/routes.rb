Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :songs
  resources :artists

  get 'my-songs', to: 'songs#my_songs'

  root 'songs#index'
end
