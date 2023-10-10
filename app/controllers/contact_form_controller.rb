class ContactFormController < ApplicationController

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]
    attachment = params[:attachment]

    ContactMailer.contact_email(name, email, message, attachment).deliver_now

    render json: { status: 'success' }
  end
end