class HomesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'home'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.broadcast(image,action)
  		ActionCable.server.broadcast 'home',create:ApplicationController.render(partial:'images/sin_image',locals:{image:image})
  end
end
