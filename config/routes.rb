Rails.application.routes.draw do
  # get 'doctors/index'
  # get 'doctors/show'
  # get 'users/index'
  # get 'users/show'
  # get 'home/index'
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
