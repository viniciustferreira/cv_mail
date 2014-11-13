require "./App/email.rb"


describe "Email" do

	before(:all) do
		@email = Email.new
		@data = 
		{
	 		:domain => 'gmail.com',
	 		:user => 'user',
	 		:password => "xxxxx",
	 		:smtp => 'smtp.gmail.com',
	 		:attachment =>"./Config/cv.pdf",
		}

		@config_file = File.new("./Config/body.txt","r")
		
	end

	describe "sending the email with attachment" do
		it "should be true" do
			expect(@email.send_email( 'teste','xxxxxx@xxxmail.com','xxxxx@xxxxmail.com','test', @data) ).not_to be_nil	
		end
	end
end
