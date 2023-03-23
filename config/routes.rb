Rails.application.routes.draw do
  # API routes are defined within the "api" namespace to keep them separate from any other non-API routes in the future
  namespace :api do
    namespace :v1 do
      post 'firebase_sessions/create' # Updated from 'get' to 'post'

      # Users routes
      resources :users, only: [:show, :update, :create] do
        # Custom route for updating user's profile picture
        put 'update_profile_picture', on: :member
      end

      # Cities routes
      resources :cities, only: [:index]

      # Categories
      resources :categories, only: [:index]

      # Lists routes
      resources :lists, only: [:index, :create, :update, :destroy] do
        # Nested List Items routes
        resources :list_items, only: [:index, :create, :update, :destroy]

        # Custom routes for pinning and unpinning lists
        post 'pin', on: :member
        delete 'unpin', on: :member
      end

      # Pins routes
      resources :pins, only: [:index, :create, :destroy]

      # Pinned Lists routes
      resources :pinned_lists, only: [:index, :show]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
