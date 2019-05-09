Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: "login#login", as: :login
      post '/owners/:owner_id/dogs/:dog_id/appointments/:appointment_id/walks', to: "walks#create"
      patch '/owners/:owner_id/dogs/:dog_id/appointments/:appointment_id/walks/:walk_id', to: "walks#update"
      get '/walks', to: "walks#index"
      get '/dogs/:dog_id/apps', to: "find_apps_by_dogs#apps"
      get '/dogs', to: "all_dogs#all"
      delete '/dogs/:dog_id', to: "all_dogs#destroy"
      get '/trackings', to: "all_trackings#all"
      delete '/trackings/:tracking_id', to: "all_trackings#destroy"
      delete '/trackings', to: "all_trackings#destroy_all"

      resources :owners do
        resources :dogs
      end
      resources :walkers do
        resources :appointments do 
          resources :trackings
        end
      end
      resources :walks
    end
  end
end