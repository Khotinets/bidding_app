App.bid = App.cable.subscriptions.create "BidChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('.card-body.bids' + '#' + data.auction_id).prepend data.bid
    $('#' + data.bid_id).hide().fadeIn(500)