Rails.application.routes.draw do
 resources :teachers do
  resources :students, except: [:create]
 end
end
