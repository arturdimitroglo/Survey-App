Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :surveys do 
    resources :questions do 
      get 'new_multiple_choice', on: :member

      get 'new_open_ended', on: :member

      get 'new_multiple_answer', on: :collection
    end
  end
  root "surveys#index"
end
