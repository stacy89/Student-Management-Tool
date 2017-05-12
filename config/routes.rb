Rails.application.routes.draw do
 resources :teachers
 post '/teachers/:id/group', to: 'teachers#group', as: 'new_group'
 resources :students, except: [:create]

 resources :sessions, only: [:new, :create, :destroy]
 root "students#index"

 get '/nonpicked', to: 'students#nonpicked'

end
