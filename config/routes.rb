Rails.application.routes.draw do
  root to: "home/songs#index"
  scope module: :home do
    resources :songs, only: [:index]
  end
  namespace :dashboard do
    root to: "songs#index"
    resources :songs
    resources :singers
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
