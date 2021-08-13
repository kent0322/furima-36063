Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  get "login" => "users#login_form"
  resources :items

end
