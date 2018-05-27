class ImagesController < ApplicationController

	def new
		@image = Image.new
	end

	def create
		image = current_user.images.create(image_params)
		if image.present?
			redirect_to root_path
		else
			redirect_to :back
		end
	end

	def show
		if params.present? && params[:user_id].present?
			@images = Image.where(user_id:params[:user_id]).order(created_at: :desc)
		else
			redirect_to root_path
		end
	end


	private

	def image_params
		params.require(:image).permit(:photo)
	end
end
