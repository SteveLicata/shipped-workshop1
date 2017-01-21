Rails.application.routes.draw do
  devise_for :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #welcome Route:
  root "welcome#home", as: "home_page"

  root "home#index"

  #company route:
  get "/companies/:id" =>  "companies#show", as: "company"

  #jobs and boat routes:
  resources :jobs
  resources :boats

end
