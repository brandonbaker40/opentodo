Rails.application.routes.draw do
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        resources :users do
          resources :lists, except: [:show, :destroy]
        end

        resources :lists, only: [] do
          resources :items, only: [:create, :index]
        end

        resources :lists, only: [:show, :destroy]

        resources :items, only: [:show, :destroy]

      end
    end
  end
