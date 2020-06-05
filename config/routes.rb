Rails.application.routes.draw do


  resources :posts, only: [:create, :ips, :index] do
    resource :rates, only: [:create]
    get '/:count', to: 'posts#index', on: :collection
    get '/ips', to: 'posts#ips', on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
