App.bid = App.cable.subscriptions.create "BidChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#' + data.auction_id + '.card-body.bids').prepend('<div class = "new-bid">' + data.bid + '</div>')
    $('#' + data.auction_id + '.bids-sum').replaceWith('<div class= "bids-sum" id = "' + data.auction_id+'">' +'$'+ data.bids_sum + '</div>')
    $('#' + data.auction_id + '.bids-sum').hide().fadeIn(500)
    $('#' + data.bid_id).hide().fadeIn(500)