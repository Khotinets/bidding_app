class BidChannel < ApplicationCable::Channel
  def subscribed
    stream_from "bid_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
