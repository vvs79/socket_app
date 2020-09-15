class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for Chat.find_by(id: params[:chat])
  end
end
