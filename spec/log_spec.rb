require "./App/log.rb"

describe "Log" do

	before(:all) do
		@path = "./Log/"
		@log = Log.new(@path)
	end

	describe "creating a log file and write into it" do
		it "should create a file" do
			@log.create_log_file
			expect(File.exist?(@path)).to be_true
		end

		it "should write in a log file" do
			@log.insert_log_file("testing")
			file = File.new(@path, "r")
			ret = false
			file.each_line do  |line| 
				if line.match("testing")
					ret = true
				end
			end
			file.close	
			expect(ret).to be_true
		end
	end
end
