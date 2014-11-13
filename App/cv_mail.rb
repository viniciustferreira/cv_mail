require "./email.rb"
require "./log.rb"
require "./xml.rb"

class CVMail
	def send_curriculum(path_cv, path_list, name_user)
		@email = Email.new
		@log = Log.new("../Log/")
		@xml = Xml.new("../Config/dados_email.xml","../Config/data.xml","../Config/body.xml")
		ret = true	

		@xml.read_xml
		@xml.read_data_file
		@log.create_log_file
		begin
			(0..@xml.get_file_size-1).each do |i|
				@xml.read_body(@xml.get_type[i].text)
				@msg = @email.send_email(@xml.get_subject[i].text, name_user, @xml.get_email[i].text, @xml.get_body, @xml.get_data)
				@log.insert_log_file("Send mail to: "+@xml.get_email[i].text)
			end
		rescue
			@log.insert_log_file("Send email fail. ")
			ret = false
		ensure	
			@log.insert_log_file("Send mail email completed.")
		end

		return ret
		
	end
end


path_curriculum = ".../Config/curriculum.pdf"
path_mail_list = ".../Config/dados_email.xml" 
cv_mail = CVMail.new
cv_mail.send_curriculum(@path_curriculum,@path_mail_list, "Name")
