Rails.application.routes.draw do
  devise_for :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#home", as: "home_page"

  root "home#index"

  get "/companies/:id" =>  "companies#show", as: "company"

  resources :jobs
  resources :boats

end
