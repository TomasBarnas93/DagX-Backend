Rails.application.routes.draw do

  # Define the root path route ("/")
  root "welcome#index" # Adjust the controller and action as needed

  # Resourceful route for handling contact form submissions
  resources :contact_forms, only: [:create]

  get 'contact_form', to: 'contact_form#new'
  post 'contact_form', to: 'contact_form#create'
end