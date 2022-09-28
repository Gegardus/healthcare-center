Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions',
    passwords: 'doctors/passwords',
    registrations: 'doctors/registrations'
  }

  resources :users
  resources :doctors
  resources :appointments

  unauthenticated do
    root "home#index"
  end

  authenticated :doctor do
    root 'doctors#index', as: :authenticated_doctor_root
  end

  authenticated :user do
    root 'users#index', as: :authenticated_user_root
  end
end
