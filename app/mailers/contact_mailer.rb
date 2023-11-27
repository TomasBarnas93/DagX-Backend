class ContactMailer < ApplicationMailer
  def contact_email(name, email, message, size, attachment)
    @name = name
    @email = email
    @message = message
    @size = size
    
    if attachment.present?
      attachments[attachment.original_filename] = {
        mime_type: attachment.content_type,
        content: attachment.read
      }
    end
    
    mail(to: 'dagx.art@gmail.com', subject: 'Kontakt z DagX.se')
  end
end
