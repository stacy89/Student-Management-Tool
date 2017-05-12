Rails.application.routes.draw do
 resources :teachers
 post '/teachers/:id/group', to: 'teachers#group', as: 'new_group'
 resources :students, except: [:create]

 resources :sessions, only: [:new, :create, :destroy]
 root "students#index"

 get '/admins', to: 'admins#index'

 get '/nonpicked', to: 'students#nonpicked'

 post '/send_sms' => 'twilio#send_sms'


end
