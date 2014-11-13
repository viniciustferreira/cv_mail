
class Log
	
	def initialize(path)
		@name = path.concat("log"+Time.now.strftime("%d_%m_%Y")+".log")
	end

	def create_log_file
		if(!File.exist?(@name))
			@file = File.new(@name,"w")	
			@file << "creation: ".concat(Time.now.strftime("%d/%m/%Y %H:%M"))
			@file.close
		end
	end

	def insert_log_file(message)
		File.open(@name, 'a+') do |f| 
			f << "\n"+Time.now.strftime("%d/%m/%Y %H:%M:%S")+message 
		end
	end
end
