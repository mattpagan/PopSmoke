class ModelMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.new_record_notification.subject
  #
	def new_record_notification(record)
	  @record = record
	  mail to: "postmaster@app71d296ae07024b7680371c7a9a2fc2b3.mailgun.org", subject: "Success! You did it."
	end
end
