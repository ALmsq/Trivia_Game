Rails.application.routes.draw do
  resources :scores
  resources :questions
  resources :categories
  # get "/questions/random", to: 'questions#random'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
