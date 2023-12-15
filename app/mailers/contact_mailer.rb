class ContactMailer < ApplicationMailer
  def contact_email(params)
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    @size = params[:size]

    # Attach file if present
    attach_file(params[:attachment]) if params[:attachment].present?

    mail(to: 'dagx.art@gmail.com', subject: 'Kontakt z DagX.se')
  end

  private

  def attach_file(attachment)
    attachments[attachment.original_filename] = {
      mime_type: attachment.content_type,
      content: attachment.read
    }
  rescue => e
    Rails.logger.error "Error attaching file: #{e.message}"
  end
end
