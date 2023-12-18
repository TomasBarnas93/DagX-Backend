class ContactFormController < ApplicationController
  # POST /contact_form
  def create
    ContactMailer.contact_email(contact_params).deliver_now
    head :ok
  rescue => e
    process_error(e)
  end

  private

  def contact_params
    params.permit(:name, :email, :message, :size, :attachment)
  end

  def process_error(error)
    Rails.logger.error "Error in processing contact form: #{error.message}"
    render json: { status: 'error', message: error.message }, status: :internal_server_error
  end
end
