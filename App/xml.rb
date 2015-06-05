require "nokogiri"

class Xml
	def initialize(path_list, data, body,signature)
		@path = path_list
		@data_path = data
		@body_path = body
		@signature_path = signature
	end	

	def read_body body_type
		@reader = Nokogiri::XML(File.open(@body_path))
		@body = @reader.at_xpath("//body/"+body_type).text
		@body += self.signature
	end

	def read_data_file
		@reader = Nokogiri::XML(File.open(@data_path))
		@data = 
		{
			:domain => @reader.at_xpath("//data/domain").text,
		 	:user => @reader.at_xpath("//data/user").text,
		 	:password => @reader.at_xpath("//data/password").text,
		 	:smtp => @reader.at_xpath("//data/smtp").text,
		 	:attachment => @reader.at_xpath("//data/attachment").text
		}
	end

	def signature
		@signature = Nokogiri::XML(File.open(@signature_path))
		@signature.at_xpath("signature").text
	end

	def read_xml
		@reader = Nokogiri::XML(File.open(@path))
		@email = @reader.xpath("//empresas/emails/email")
		@subject = @reader.xpath("//empresas/subjects/subject")
		@type = @reader.xpath("//empresas/types/type")
	end

	
	def get_file_size
		@reader = Nokogiri::XML(File.open(@path))
		@size = @reader.xpath("//empresas/emails/email").count
		return @size
	end

	def type
		return @type.to_a
	end
	def email
		return @email.to_a
	end
 	
 	def subject
		return @subject.to_a
	end
	
	def body
		return @body
	end

	def data
		return @data
	end
end