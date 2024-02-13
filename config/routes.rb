Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "projects/:id", to: "projects#show", as: :show_projects


  get "contestants/", to: "contestants#index", as: :contestants

  post "contestant_projects/", to: "contestant_projects#create", as: :create_contestant_projects

end
