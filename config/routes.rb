Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :surveys do 
    resources :questions 
    get 'report', on: :member
  end
  resources :answers
  root "surveys#index"
end
