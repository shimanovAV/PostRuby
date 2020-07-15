Rails.application.routes.draw do

  resources :posts, only: [:index, :create] do
    get '/top', to: 'posts#top_posts', on: :collection
    get '/ips', to: 'posts#ips', on: :collection
    resource :rates, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
