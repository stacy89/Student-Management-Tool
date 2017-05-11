Rails.application.routes.draw do
 resources :teachers
  resources :students, except: [:create]

  resources :sessions, only: [:new, :create, :destroy]
  root "students#index"
end
