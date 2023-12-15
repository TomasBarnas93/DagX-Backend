class ContactFormController < ApplicationController
  before_action :validate_contact_params, only: [:create]

  def create
    Rails.logger.debug "Received parameters: #{contact_params.inspect}"

    if send_contact_email
      render json: { status: 'success' }
    else
      render json: { status: 'error', message: 'Failed to send email' }, status: :internal_server_error
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :message, :size, :attachment)
  end

  def send_contact_email
    ContactMailer.contact_email(contact_params).deliver_now
    true
  rescue => e
    Rails.logger.error "Error in processing contact form: #{e.message}"
    false
  end

  def validate_contact_params
    unless contact_params[:email].present? && contact_params[:name].present?
      render json: { status: 'error', message: 'Missing required fields' }, status: :bad_request
      return false
    end
    true
  end
end
