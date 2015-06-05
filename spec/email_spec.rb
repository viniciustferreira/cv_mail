require "./App/email.rb"


describe "Email" do

	before(:all) do
		@email = Email.new
		@data = 
		{
	 		:domain => 'gmail.com',
	 		:user => 'viniciustferreira.affairs',
	 		:password => "S@ra5432Um",
	 		:smtp => 'smtp.gmail.com',
	 		:attachment =>"./Config/curriculum.pdf",
		}

		@config_file = File.new("./Config/body.xml","r")
		
	end

	describe "sending the email with attachment" do
		it "should be true" do
			expect(@email.send_email( 'teste','viniciustferreira@gmail.com','viniciustferreira@gmail.com','teste', @data) ).not_to be_nil	
		end
	end
end