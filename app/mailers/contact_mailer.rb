class ContactMailer < ApplicationMailer
  default to: 'dagx.art@gmail.com', subject: 'Kontakt z DagX.se'

  def contact_email(params)
    @contact = OpenStruct.new(params)

    attach_file(params[:attachment]) if params[:attachment].present?

    mail
  end

  private

  def attach_file(attachment)
    attachments[attachment.original_filename] = {
      mime_type: attachment.content_type,
      content: attachment.read
    }
  rescue => e
    Rails.logger.error "Error attaching file: #{e.message}"
    # Consider whether you want to raise an error or just log it
  end
end
