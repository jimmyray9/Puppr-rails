Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: "login#login", as: :login
      resources :owners do
        resources :dogs
      end
      resources :walkers do
        resources :appointments
      end
    end
  end
end
