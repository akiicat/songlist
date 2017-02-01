Rails.application.routes.draw do
  concern :grouping do |options|
    scope options do
      root to: "songs#index"
      resources :songs
      resources :singers
    end
  end

  concerns :grouping, only: [:index, :show]

  scope :dashboard, as: :dashboard do
    concerns :grouping, dashboard: true
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
