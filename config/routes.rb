Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/projects/:id", to: "projects#show"

  get "/contestants", to: "contestants#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
