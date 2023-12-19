Rails.application.routes.draw do
  # Set the root path to the new action of the ContactFormController
  root "contact_form#new"

  # Resourceful route for handling contact form submissions
  resources :contact_forms, only: [:create]

  # Explicit routes for the contact form
  get 'contact_form', to: 'contact_form#new'
  post 'contact_form', to: 'contact_form#create'

  # Catch-all route to handle any unrecognized paths
  # Redirects to the root path or you can render a custom 404 page
  match '*path', to: redirect('/'), via: :all
end
