Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: "login#login", as: :login
      resources :owners do
        resources :dogs
        resources :walks
      end
      resources :walkers do
        resources :appointments do 
          resources :trackings
          resources :walks
        end
      end
      resources :walks
    end
  end
end
