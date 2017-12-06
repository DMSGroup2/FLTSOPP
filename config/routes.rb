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

  get '/d_query' => 'drivers#query'

  get '/v_query' => 'violations#query'

  get '/o_query' => 'officers#query'

  get '/l_query' => 'locations#query'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
