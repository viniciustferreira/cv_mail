require "./App/log.rb"

describe "Log" do

	before(:all) do
		@path = "./Log/"
		@log = Log.new(@path)
	end

	describe "creating a log file and write into it" do
		it "should create a file" do
			@log.create_log_file
			expect(File.exist?(@path)).to eql(true)
		end

		it "should write in a log file" do
			@log.insert_log_file("testando")
			file = File.new(@path, "r")
			ret = false
			# file.seek(-2, IO::SEEK_END).match(/testando/)
			file.each_line do  |line| 
				if line.match(/testando/) 
					ret = true
				end
			end
			
			file.close	
			expect(ret).to eql(true)
		end
	end
end