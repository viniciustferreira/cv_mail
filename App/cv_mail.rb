require "./App/email.rb"
require "./App/log.rb"
require "./App/xml.rb"

class CVMail
	def send_curriculum(path_cv, path_list, name_user, data)
		@email = Email.new
		@log = Log.new("./Log/")
		# @xml = Xml.new("./Config/dados_email.xml","./Config/data.xml","./Config/body.xml","./Config/signature.xml")
		@xml = Xml.new(data[0], data[1], data[2] ,data[3] )
		ret = true

		@xml.read_xml
		@xml.read_data_file
		@log.create_log_file

		begin
			(0..@xml.get_file_size-1).each do |i|
				@xml.read_body(@xml.type[i].text)
				@email.send_email(@xml.subject[i].text, name_user, @xml.email[i].text, @xml.body, @xml.data)
				@log.insert_log_file("Send mail to: "+@xml.email[i].text)
			end
		rescue RuntimeError 
			@log.insert_log_file("Send email fail.")
			ret = false
		end
		if(ret)
			@log.insert_log_file("Send mail email completed.")
		end
		return ret
	end
end


# path_curriculum = ".../Config/curriculum.pdf"
# path_mail_list = ".../Config/dados_email.xml" 
# cv_mail = CVMail.new
# cv_mail.send_curriculum(@path_curriculum,@path_mail_list, "Vinicius Ferreira")