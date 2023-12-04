class ContactFormController < ApplicationController
  def create
    Rails.logger.debug "Received parameters: #{contact_params.inspect}"

    begin
      # Send email even if the attachment is not present
      ContactMailer.contact_email(contact_params).deliver_now
      render json: { status: 'success' }
    rescue => e
      Rails.logger.error "Error in processing contact form: #{e.message}"
      render json: { status: 'error', message: e.message }, status: :internal_server_error
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :message, :size, :attachment)
  end
end
