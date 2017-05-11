Rails.application.routes.draw do
 resources :teachers
  resources :students, except: [:create]

  resources :sessions, only: [:new, :create, :destroy]
  root "students#index"

  get '/nonpicked', to: 'students#nonpicked'
end
