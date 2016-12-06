Rails.application.routes.draw do
  root to: "home/songs#index"
  scope module: :home do
    resources :playlists
    resources :songs
  end
  namespace :dashboard do
    resources :playlists
    resources :songlists
    resources :songinfos
    resources :songs
    resources :singers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
