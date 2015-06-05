require "./App/xml.rb"

describe "Xml" do 

	before(:all) do
		@xml = Xml.new("./Config/dados_email_teste.xml","./Config/data.xml","./Config/body.xml","./Config/signature_teste.xml")
		@data = 
		{
			:domain => 'gmail.com',
	 		:user => 'viniciustferreira.affairs',
	 		:password => "S@ra5432Um",
	 		:smtp => 'smtp.gmail.com',
	 		:attachment =>"./Config/curriculum.pdf",
		}
	end

	describe "recovering data from xml file" do
		it "should give me email" do
			@xml.read_xml
			expect(@xml.email[0].text).to be_eql("viniciustferreira@gmail.com") 
		end

		it "should return the quantity of the emails in the file" do
			expect(@xml.get_file_size).to be_equal(1)
		end

		it "should access the data file and get the data" do
			@xml.read_data_file
			expect(@xml.data).to be_eql(@data)
		end
		it "should give me the body" do
			@xml.read_body "teste"
			expect(@xml.body).to be_eql("teste de corpo#teste assinatura")
		end

	end

	
end
