Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "start_pages#home"
  # get "/analyze", to: "start_pages#analyze"
  get "/analyze", to: "start_pages#analyze"
  get "/source", to: "start_pages#source"
end
