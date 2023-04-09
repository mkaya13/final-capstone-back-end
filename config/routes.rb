Rails.application.routes.draw do
  devise_for :users, path: 'auth/users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup',
    password: 'password'
  },
controllers: {
sessions: 'users/sessions',
registrations: 'users/registrations',
confirmations: 'users/confirmations',
passwords: 'users/passwords'
}

  resources :appointments, only: [:index, :create, :destroy]

  resources :doctors

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/doctor-appointment-times', to: 'doctor_appointment_times#index'
      resources :doctors, only: [:index, :show]
    end
  end

  
  

end


