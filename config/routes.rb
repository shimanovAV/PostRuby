Rails.application.routes.draw do

  resources :posts, only: [:create] do
    get '/top', to: 'posts#top_posts', on: :collection
    get '/ips', to: 'posts#ips', on: :collection
    resource :rates, only: [:create]
  end
  resources :users do
    get '/search', to: 'users#search', on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
