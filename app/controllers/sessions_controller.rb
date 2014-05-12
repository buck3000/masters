class SessionsController < ApplicationController

	def login
	  @user = User.find_by_email(params[:email])
	  if @user.password == params[:password]
	    give_token
	  else
	    redirect_to home_url
	  end
	 end



 	def forgot_password
    @user = User.find_by_email(params[:email])
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @user.password = random_password
    @user.save!
    Mailer.create_and_deliver_password_change(@user, random_password)
 	end


 	def logout
 		session.clear
 		redirect_to home_url
 	end

end
