App.bid = App.cable.subscriptions.create "BidChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('.card-body.bids' + '#' + data.auction_id).prepend('<div class = "new-bid">' + data.bid + '</div>')
    $('.bids-sum').replaceWith('<div class= "bids-sum">' +'$'+ data.bids_sum + '</div>')
    $('.bids-sum, #' + data.bid_id).hide().fadeIn(500)