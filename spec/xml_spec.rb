require "./App/xml.rb"

describe "Xml" do 

	before(:all) do
		@xml = Xml.new("./Config/dados_email.xml","./Config/data.xml","./Config/body.xml")
		@data = 
		{
			:domain => 'gmail.com',
	 		:user => 'user',
	 		:password => "xxxxxx",
	 		:smtp => 'smtp.gmail.com',
	 		:attachment =>"./Config/cv.pdf",
		}
	end

	describe "recovering data from xml file" do
		it "should give me email" do
			@xml.read_xml
			expect(@xml.get_email[0].text).to be_eql("xxxxxx@xmail.com") and 
			expect(@xml.get_email[1].text).to be_eql("xxxxxx@hotmail.com")
		end

		it "should return the quantity of the emails in the file" do
			expect(@xml.get_file_size).to be_equal(2)
		end

		it "should access the data file and get the data" do
			@xml.read_data_file
			expect(@xml.get_data).to be_eql(@data)
		end
		it "should give me the body" do
			@xml.read_body "ruby"
			expect(@xml.get_body).to be_eql("test of the mail body")
		end

	end

	
end
