Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: "login#login", as: :login
      post 'owners/:owner_id/dogs/:dog_id/appointments/:appointment_id/walks', to: "walks#create"
      get '/walks', to: "walks#index"
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