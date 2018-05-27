class ImageBroadCastJob < ApplicationJob
  queue_as :default

   def perform(image)
   	total_image = Image.count
    ActionCable.server.broadcast "home", {create: render_image(image),for_id:image.user_id,total_image:total_image}
  end

  private
    def render_image(image)
      ApplicationController.renderer.render(partial: 'images/sin_image', locals: { image: image })
    end
end
