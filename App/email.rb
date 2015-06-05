require 'net/smtp'
require 'mail'
require './App/log.rb'

class Email
	def initialize
		@log = Log.new("./Log/")
	end
	
	def send_email(subject_p, from_p, to_p, message_p, data_p)
		begin
			mail = Mail.new
			mail.body = message_p
			mail.to = to_p
			mail.from = from_p
			mail.subject = subject_p
			mail.add_file(data_p[:attachment])
			smtp = Net::SMTP.new(data_p[:smtp], 587 )
			smtp.enable_starttls
			smtp.start(data_p[:domain], data_p[:user], data_p[:password]) do |smtp|
				@msg = smtp.send_message(mail.encoded, mail.from, mail.to)
			end
		rescue Net::SMTPFatalError
			@log.create_log_file
			@log.insert_log_file("Error on Email class. ")
		end	
			return @msg
	end
end