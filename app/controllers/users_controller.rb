class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find_by_id(params[:id])
	end

	def create
	 @user = User.new(name: params[:name], email: params[:email])
	 @user.password = params[:password]
	 if @user.save!
	 	redirect_to '/'

	 else
	 	redirect_to '/show/:id'
	 end
	end

	def new 
	end

	def edit
		@user = User.find_by_id(session[:user_id])
		if @user.save!
			redirect_to 'groups#index'

		else 
			redirect_to 'user#show'
		end
	end

	def update

	end

	def destroy
		@user = User.find_by_id(session[:user_id])
	end
	

end
