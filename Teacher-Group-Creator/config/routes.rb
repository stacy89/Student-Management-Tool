Rails.application.routes.draw do
 resources :teachers
  resources :students, except: [:create]
end
