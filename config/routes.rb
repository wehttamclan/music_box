Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :artists, shallow: true do
    resources :songs, except: [:index]
  end

  resources :songs, only: [:index]
  resources :playlists

  resources :users, only: [:new, :create, :show]
end
