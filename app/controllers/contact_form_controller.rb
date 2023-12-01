class ContactFormController < ApplicationController

  def new
    render json: { message: 'Formularz kontaktowy' }
  end

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]
    size = params[:size]
    attachment = params[:attachment]

    ContactMailer.contact_email(name, email, message, size, attachment).deliver_now

    render json: { status: 'success' }
  end
end