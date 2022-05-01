Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/auth", to: "sessions#create"
  post "/choices", to: "choices#create"
  get "/choices", to: "choices#index"
end
