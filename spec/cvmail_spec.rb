require "./App/cv_mail.rb"


describe "CV_Mail" do
	before(:all) do
		@cv_mail = CVMail.new 
		@path_curriculum = "./Config/curriculum.pdf"
		@path_mail_list = "./Config/dados_email.xml" 
	end

	describe "sending a email with a cv" do
		it "should read a list of emails, send an email with a CV and generate a log " do
			expect(@cv_mail.send_curriculum(@path_curriculum,@path_mail_list, "Name")).to be_true
		end
	end
end
