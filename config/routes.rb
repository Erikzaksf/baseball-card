Rails.application.routes.draw do
  devise_for :users
  resources :others
  resources :teams
  resources :projects
  resources :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
