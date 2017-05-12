Rails.application.routes.draw do
  get 'welcome/index'

 resources :teachers
 post '/teachers/:id/group', to: 'teachers#group', as: 'new_group'
 resources :students, except: [:create]

 resources :sessions, only: [:new, :create, :destroy]
 root "welcome#index"

 get '/admins', to: 'admins#index'

 get '/nonpicked', to: 'students#nonpicked'

 post '/send_sms', to: 'twilio#send_sms'

 put '/assign_student_to_teacher/:id', to: 'students#assign_student', as: "assign_student_to_teacher"

end
