class ChatMessagesController < ApplicationController
  before_action :_get_chat

  def create
    @chat_message = ChatMessage.create user: current_user,
                                       chat: @chat,
                                       message: params.dig(:chat_message, :message)
    ChatChannel.broadcast_to @chat, @chat_message
  end

  private

  def _get_chat
    @chat = Chat.find_by(id: params.dig(:chat_message, :chat_id))# params[:chat_message][:chat_id]
  end
end
