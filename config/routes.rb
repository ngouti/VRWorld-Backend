Rails.application.routes.draw do
  get 'relationships/follow_user'
  get 'relationships/unfollow_user'

  match 'collections/:id/images' => 'collections#images', :via => [:get, :post]
  post ':username/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':username/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user
  get 'users/following/:id', to: 'users#following', as: :following
  resources :relationships
  resources :collections
  resources :images
  resources :users
  resources :auth
  # get '/users/:id/images', to: 'users#all_images'
  # match 'images/:id/show' => 'images#show', :via => [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
