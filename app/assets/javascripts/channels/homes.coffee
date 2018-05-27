App.homes = App.cable.subscriptions.create "HomesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("homes subscribed")
    
  disconnected: ->
   # Called when the subscription has been terminated by the server
    console.log("disconnected")
  received: (data) ->
    console.log(data)
    if data.create
      $(".imagesWrapper[data-user=all]").prepend(data.create)
      $(".imagesWrapper[data-user="+data.for_id+"]").prepend(data.create)
      $("#imageCounter").html(data.total_image)
