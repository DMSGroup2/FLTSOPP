Rails.application.routes.draw do
  resources :violations
  resources :stops
  resources :officers
  resources :locations
  resources :located_ats
  resources :gives
  resources :drivers
  get 'welcome/index'

  root 'welcome#index'

  get "/pages/:page" => "pages#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
