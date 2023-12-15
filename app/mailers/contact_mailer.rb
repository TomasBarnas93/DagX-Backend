class ContactMailer < ApplicationMailer
  def contact_email(params)
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    @size = params[:size]

    begin
      if params[:attachment].present?
        attachment = params[:attachment]
        attachments[attachment.original_filename] = {
          mime_type: attachment.content_type,
          content: attachment.read
        }
      end
    rescue => e
      Rails.logger.error "Error attaching file: #{e.message}"
      # Handle the error according to your needs
    end
    
    mail(to: 'dagx.art@gmail.com', subject: 'Kontakt z DagX.se')
  end
end
