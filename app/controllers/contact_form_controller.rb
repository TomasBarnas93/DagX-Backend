class ContactFormController < ApplicationController

  def create
    name = params[:name]
    email = params[:email]
    message = params[:message]
    size = params[:size]
    attachment = params[:attachment]

    if attachment.respond_to?(:read)
      ContactMailer.contact_email(name, email, message, size, attachment).deliver_now
      render json: { status: 'success' }
    else
      render json: { status: 'error', message: 'Attachment is not a file' }, status: :unprocessable_entity
    end
  end
end