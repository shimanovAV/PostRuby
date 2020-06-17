Rails.application.routes.draw do


  resources :posts, only: [:create, :ips, :index] do
    get '/:count', to: 'posts#index', on: :collection
    get '/ips', to: 'posts#ips'
    resource :rates, only: [:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
