class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for Chat.find(params[:chat])
  end
end
