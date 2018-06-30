Rails.application.routes.draw do
  get 'static_pages/tweet'

  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/index', to: 'users#index'
  get '/user', to: 'users#user'
  get '/tweet', to: 'static_pages#tweet'
  get '/goods', to: 'goods#goods'
  post '/user', to: 'users#user'


  root to: 'static_pages#home'
end
