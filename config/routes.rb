Rails.application.routes.draw do
  root 'pages#index'

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete 'logout', to: 'session#destroy', as: :logout

  namespace :admin do
    root 'home#index'
    # get '/teacher', to: 'teachers#index'
    # get '/teacher/new', to: 'teachers#new'
    resources :teachers, only: [:index, :edit, :new, :create, :update]
    resources :students, only: [:index, :edit, :new, :create, :update]
    resources :courses, only: [:index, :edit, :new, :create, :update]
    resources :master_classes, only: [:index, :edit, :new, :create, :update]
    resources :course_enrollments, only: [:index, :edit, :new, :create, :update]
    resources :report_criteria, only: [:index, :edit, :new, :create, :update]
  end

  namespace :teacher do
    root 'home#index'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
