class ContactFormController < ApplicationController
  def create
    Rails.logger.debug "Received parameters: #{contact_params.inspect}"

    if params[:attachment].present? && params[:attachment].respond_to?(:read)
      begin
        ContactMailer.contact_email(contact_params).deliver_now
        render json: { status: 'success' }
      rescue => e
        render json: { status: 'error', message: e.message }, status: :internal_server_error
      end
    else
      render json: { status: 'error', message: 'Attachment is not a file or missing' }, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :message, :size, :attachment)
  end
end
