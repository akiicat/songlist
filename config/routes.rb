Rails.application.routes.draw do
  namespace :home do
    resources :playlists
    resources :songlists
  end
  namespace :dashboard do
    resources :playlists
    resources :songlists
    resources :songs
    resources :singers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
