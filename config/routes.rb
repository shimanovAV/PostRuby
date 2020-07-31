Rails.application.routes.draw do

  resources :posts, only: [:index, :create] do
    get '/ips', to: 'posts#ips', on: :collection
    resource :rates, only: [:create]
  end
  resources :users do
    resources :users, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
