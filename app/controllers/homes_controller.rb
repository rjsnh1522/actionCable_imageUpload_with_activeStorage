class HomesController < ApplicationController

	def index 
		@images = Image.all.order(created_at: :desc)
	end

	def new
		
	end

	def check_user_email
		user = User.where(email:params[:email]).last

		user = user.present? ? true : false
		render json:  {
			data: user
		}
	end
	
end
